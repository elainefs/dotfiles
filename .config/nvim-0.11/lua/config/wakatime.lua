-- Show Wakatime Stats in Lualine
local Job = require("plenary.job")
local async = require("plenary.async")
local uv = vim.loop

local get_wakatime_time = function()
	local tx, rx = async.control.channel.oneshot()
	local ok, job = pcall(Job.new, Job, {
		command = os.getenv("HOME") .. "/.wakatime/wakatime-cli",
		args = { "--today" },
		on_exit = function(j, _)
			tx(j:result()[1] or "")
		end,
	})
	if not ok then
		vim.notify("Bad WakaTime call: " .. job, vim.log.levels.WARN)
		return ""
	end

	job:start()
	return rx()
end

local state = { comp_wakatime_time = "" }

local Wakatime_routine_init = false

local wakatime = function()
	local WAKATIME_UPDATE_INTERVAL = 10000

	if not Wakatime_routine_init then
		local timer = uv.new_timer()
		if timer == nil then
			return ""
		end

		uv.timer_start(timer, 500, WAKATIME_UPDATE_INTERVAL, function()
			local function format_wakatime_output(time)
				if not time or time == "" then
					return ""
				end
				local hours = time:match("(%d+)%s*hr")
				if hours then
					return hours .. "h Coding"
				end

				local mins = time:match("(%d+)%s*min")
				if mins then
					return mins .. "m Coding"
				end
				return ""
			end

			async.run(get_wakatime_time, function(time)
				state.comp_wakatime_time = format_wakatime_output(time)
			end)
		end)

		Wakatime_routine_init = true
	end

	return state.comp_wakatime_time
end

return wakatime

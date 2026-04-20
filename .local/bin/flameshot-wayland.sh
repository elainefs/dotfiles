#!/bin/bash

# Força o Flameshot a usar o backend Wayand (Qt Platform Abstraction)
export QT_QPA_PLATFORM=wayland

# Executa o Flameshot no modo GUI
flameshot gui

#!/usr/bin/env bash
# Based on install.sh from the EasyEffects-Presets repo by JackHack96, licensed under MIT
# This script automatically detect the EasyEffects presets directory and installs the presets

GIT_REPOSITORY="https://raw.githubusercontent.com/kikislater/thinkpad-p14s-g5-linux/master"

check_installation() {
	if command -v flatpak &>/dev/null && flatpak list | grep -q "com.github.wwmm.easyeffects"; then
		PRESETS_DIRECTORY="$HOME/.var/app/com.github.wwmm.easyeffects/config/easyeffects"
	elif which easyeffects >/dev/null; then
		PRESETS_DIRECTORY="$HOME/.config/easyeffects"
	else
		echo "Error! Couldn't find EasyEffects presets directory!"
		exit 1
	fi
	mkdir -p "$PRESETS_DIRECTORY"
}

check_impulse_response_directory() {
    mkdir -p "$PRESETS_DIRECTORY/irs"
	mkdir -p "$PRESETS_DIRECTORY/output"
}

install_presets() {
	echo "Installing impulse response files..."
	set -o pipefail
	curl -fsS "$GIT_REPOSITORY/easyeffects/P14s_G5_Dynamic.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G5_Dynamic.irs" || echo "Warning: failed to download P14s_G5_Dynamic.irs"
	curl -fsS "$GIT_REPOSITORY/easyeffects/P14s_G5_Game.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G5_Game.irs" || echo "Warning: failed to download P14s_G5_Game.irs"
	curl -fsS "$GIT_REPOSITORY/easyeffects/P14s_G5_Movie.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G5_Movie.irs" || echo "Warning: failed to download P14s_G5_Movie.irs"
	curl -fsS "$GIT_REPOSITORY/easyeffects/P14s_G5_Music.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G5_Music.irs" || echo "Warning: failed to download P14s_G5_Music.irs"
	curl -fsS "$GIT_REPOSITORY/easyeffects/P14s_G5_Voice.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G5_Voice.irs" || echo "Warning: failed to download P14s_G5_Voice.irs"
	echo "Installing ThinkPad P14s G5 presets..."
	curl -fsS "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G5%20-%20Legacy.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G5 - Legacy.json" || echo "Warning: failed to download ThinkPad P14s G5 - Legacy.json"
	curl -fsS "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G5%20-%20Dynamic.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G5 - Dynamic.json" || echo "Warning: failed to download ThinkPad P14s G5 - Dynamic.json"
	curl -fsS "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G5%20-%20Game.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G5 - Game.json" || echo "Warning: failed to download ThinkPad P14s G5 - Game.json"
	curl -fsS "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G5%20-%20Movie.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G5 - Movie.json" || echo "Warning: failed to download ThinkPad P14s G5 - Movie.json"
	curl -fsS "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G5%20-%20Music.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G5 - Music.json" || echo "Warning: failed to download ThinkPad P14s G5 - Music.json"
	curl -fsS "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G5%20-%20Voice.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G5 - Voice.json" || echo "Warning: failed to download ThinkPad P14s G5 - Voice.json"
}

check_installation
check_impulse_response_directory
install_presets

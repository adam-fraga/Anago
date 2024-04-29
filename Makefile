.PHONY: install run

# Directories
SRC_DIR := ./src
CMD_DIR := ./cmd
VIEWS_DIR := ./views
HANDLERS_DIR := ./handlers
ASSETS_DIR := ./assets
MODELS_DIR := ./models
CONFIG_DIR := ./config

# Assets directories
STYLES_SRC_DIR := $(SRC_DIR)/styles
SCRIPTS_SRC_DIR := $(SRC_DIR)/scripts
STYLES_DIR := $(ASSETS_DIR)/styles
SCRIPTS_DIR := $(ASSETS_DIR)/scripts
IMG_DIR := $(ASSETS_DIR)/img
FONTS_DIR := $(ASSETS_DIR)/fonts

# SRC Directories

# Proxy for the templ command launch air server first
templ:
	@templ generate -watch -proxy=http://localhost:3000

webpack:
	@npm run dev

tailwind:
	@npx tailwindcss -i /usr/src/app/src/styles/input.css -o /usr/src/app/assets/styles/styles.css --watch

# Run this command to init the structure of the project
init:
	echo "Create project strucutre..."
	mkdir -p $(STYLES_SRC_DIR)
	mkdir -p $(SCRIPTS_SRC_DIR)
	mkdir -p $(STYLES_DIR)
	mkdir -p $(SCRIPTS_DIR)
	mkdir -p $(IMG_DIR)
	mkdir -p $(FONTS_DIR)
	mkdir -p $(VIEWS_DIR)
	mkdir -p $(HANDLERS_DIR)
	mkdir -p $(MODELS_DIR)
	mkdir -p $(CMD_DIR)
	cp $(CONFIG_DIR)/* .
	echo "Project structure created!"
	echo "Installing dependencies..."
	npm install typescript ts-loader webpack webpack-cli tailwindcss daisyui@latest -D
	npm install htmx.org
	npm install --save-dev clean-webpack-plugin
	npm install --save-dev html-webpack-plugin
	echo "Dependencies installed!"

# Run this command to clean the project
clean:
	echo "Cleaning up..."
	rm -rf ./assets/styles/styles.css
	rm -rf ./assets/scripts/bundle.js
	rm -rf ./node_modules

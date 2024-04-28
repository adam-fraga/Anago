.PHONY: install run

# Project name
PROJECT_NAME := $(Anago) #REPLACE WITH YOUR PROJECT NAME
PROJECT_REPO := github.com/adam-fraga/$(PROJECT_NAME) #REPLACE WITH YOUR PROJECT REPO

# Directories
SRC_DIR := ./src
CMD_DIR := ./cmd
VIEWS_DIR := ./views
HANDLERS_DIR := ./handlers
ASSETS_DIR := ./assets
MODELS_DIR := ./models

# Assets directories
STYLES_DIR := $(ASSETS_DIR)/styles
SCRIPTS_DIR := $(ASSETS_DIR)/scripts
SCRIPTS_DIR := $(ASSETS_DIR)/scripts
IMG_DIR := $(ASSETS_DIR)/img
FONTS_DIR := $(ASSETS_DIR)/fonts

# SRC Directories
STYLES_SRC_DIR := $(SRC_DIR)/styles
SCRIPTS_SRC_DIR := $(SRC_DIR)/scripts

# Sources file to be compiled by webpack and tailwind
STYLES_SRC_FILE := $(STYLES_SRC_DIR)/styles.css
SCRIPTS_SRC_FILE := $(SCRIPTS_SRC_DIR)/index.ts

# Output files for webpack and tailwind
BUNDLE_FILE := $(SCRIPTS_DIR)/bundle.js
STYLES_FILE := $(STYLES_DIR)/styles.css

# Proxy for the templ command launch air server first
templ:
	@templ generate -watch -proxy=http://localhost:3000

webpack:
	@npm run dev

tailwind:
	@npx tailwindcss -i .$(STYLES_SRC_FILE) -o .$(STYLES_FILE) --watch

# Run this command to init the structure of the project
init:
	@echo "Create project strucutre..."
	@mkdir -p $(STYLES_SRC_DIR) && touch $(STYLES_SRC_FILE)
	@mkdir -p $(SCRIPTS_SRC_DIR) && touch $(SCRIPTS_SRC_FILE)
	@mkdir -p $(STYLES_DIR)
	@mkdir -p $(SCRIPTS_DIR)
	@mkdir -p $(IMG_DIR)
	@mkdir -p $(FONTS_DIR)
	@mkdir -p $(VIEWS_DIR)
	@mkdir -p $(HANDLERS_DIR)
	@mkdir -p $(MODELS_DIR)
	@mkdir -p $(CMD_DIR) && mv main.go $(CMD_DIR)/main.go
	@npm init -y
	@mv .webpack.config.example webpack.config.js
	@mv .tailwind.config.example tailwind.config.js
	@mv .tsconfig.example tsconfig.json
	@mv .air.example .air.toml
	@echo "Project structure created!"
	@echo "Installing dependencies..."
	@npm install typescript ts-loader webpack webpack-cli tailwindcss daisyui@latest -D
	@npm install htmx.org
	@go mod init $(PROJECT_REPO)
	@go install github.com/a-h/templ/cmd/templ@latest
	@go get ./...
	@go mod vendor
	@go mod tidy
	@go mod download
	@echo "Dependencies installed!"

# Run this command to build the project
build:
	@echo "Building..."
	@npx tailwindcss -i .$(STYLES_SRC_FILE) -o .$(STYLES_FILE)
	@npm run build
	@templ generate view
	@go build ./cmd/main.go

# Run this command to clean the project
clean:
	@echo "Cleaning up..."
	@rm -rf ./assets/styles/styles.css
	@rm -rf ./assets/scripts/bundle.js
	@rm -rf ./node_modules

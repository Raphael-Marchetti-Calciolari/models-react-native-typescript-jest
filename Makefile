PROJECT_PATH := $(shell pwd)
APP_PATH := ./react-native-app

BLUE := \033[0;34m
NC := \033[0m
RED := \033[0;31m
YELLOW := \033[0;33m

install:
	@if command -v npm >/dev/null 2>&1; then \
		echo; \
		echo "Installing dependencies..."; \
		npm --prefix $(APP_PATH) install; \
	else \
		echo "$(RED)Error$(NC), node package manager (npm) is not installed on your system."; \
		echo "Please install it on $(BLUE)https://nodejs.org/en$(NC) to continue."; \
	fi

test:
	@if command -v npm >/dev/null 2>&1; then \
		echo; \
		echo "Running tests..."; \
		npm --prefix $(APP_PATH) run test; \
	else \
		echo "$(RED)Error$(NC), node package manager (npm) is not installed on your system."; \
		echo "Please install it on $(BLUE)https://nodejs.org/en$(NC) to continue."; \
	fi

watch:
	@if command -v watchman >/dev/null 2>&1; then \
		watchman watch-del '$(PROJECT_PATH)'; \
		watchman watch-project '$(PROJECT_PATH)'; \
	else \
		echo "$(YELLOW)Warning$(NC): Watchman is not installed."; \
		echo "Check it out on $(BLUE)https://facebook.github.io/watchman/$(NC)."; \
	fi

run:
	@if command -v npm >/dev/null 2>&1; then \
		make watch > /dev/null; \
		echo; \
		echo "Running project..."; \
		npm --prefix $(APP_PATH) start; \
	else \
		echo "$(RED)Error$(NC), node package manager (npm) is not installed on your system."; \
		echo "Please install it on $(BLUE)https://nodejs.org/en$(NC) to continue."; \
	fi

start:
	@if command -v npm >/dev/null 2>&1; then \
		make install; \
		make watch > /dev/null; \
		make test; \
		make run; \
	else \
		echo "$(RED)Error$(NC), node package manager (npm) is not installed on your system."; \
		echo "Please install it on $(BLUE)https://nodejs.org/en$(NC) to continue."; \
	fi
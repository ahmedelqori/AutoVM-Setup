BOLD_ITALIC_RED     := \033[1;3;31m
BOLD_ITALIC_GREEN   := \033[1;3;32m
BOLD_ITALIC_YELLOW  := \033[1;3;33m
BOLD_ITALIC_BLUE    := \033[1;3;34m
BOLD_ITALIC_CYAN    := \033[1;3;36m
UNDERLINE           := \033[4m
FLASH               := \033[5m
BOLD                := \033[1m
BACKGROUND_YELLOW   := \033[48;5;226m
RESET               := \033[0m

IP := $(shell hostname -I | awk '{print $$1}')
LOG_FILE := logs/makefile.log

.PHONY: all VBOX SERVER help clean logs

all:  VBOX SERVER 

VBOX:
	@echo "$(BOLD_ITALIC_CYAN)Creating Virtual Machine...$(RESET)"
	@bash tools/create_vbox.bash > /dev/null 2>&1 && echo "$(BOLD_ITALIC_GREEN)Virtual Machine created successfully!$(RESET)" >> $(LOG_FILE) || echo "$(BOLD_ITALIC_RED)Error in VM creation!$(RESET)" >> $(LOG_FILE)

SERVER:
	@echo "$(BOLD_ITALIC_RED)URL: \n\t$(BOLD_ITALIC_GREEN)http://$(IP):1337/install.yaml$(RESET)"
	@echo "$(BOLD_ITALIC_RED)Run this For Packages:\n\tcurl -O $(BOLD_ITALIC_GREEN)http://$(IP):1337/tools/packages.bash && sudo bash packages.bash$(RESET)"
	@echo "$(BOLD_ITALIC_RED)Run this For Customize Ubuntu:\n\tcurl -O $(BOLD_ITALIC_GREEN)http://$(IP):1337/tools/desktop.bash && bash desktop.bash$(RESET)"
	@echo "$(FLASH)$(BOLD)$(BOLD_ITALIC_RED)\t\t >> Keep it open << \n$(RESET)"
	@python3 -m http.server 1337 > /dev/null 2>&1 && echo "$(BOLD_ITALIC_GREEN)Server is running at http://$(IP):1337$(RESET)" >> $(LOG_FILE) || echo "$(BOLD_ITALIC_RED)Server failed to start!$(RESET)" >> $(LOG_FILE)

help:
	@echo "$(BOLD_ITALIC_YELLOW)Available commands:$(RESET)"
	@echo "$(BOLD_ITALIC_BLUE)make all$(RESET) - Create Virtual Machine and start the server."
	@echo "$(BOLD_ITALIC_BLUE)make VBOX$(RESET) - Create Virtual Machine."
	@echo "$(BOLD_ITALIC_BLUE)make SERVER$(RESET) - Start the server and display the installation instructions."
	@echo "$(BOLD_ITALIC_BLUE)make clean$(RESET) - Remove generated files."
	@echo "$(BOLD_ITALIC_BLUE)make logs$(RESET) - Show logs of the actions performed."

clean:
	@echo "$(BOLD_ITALIC_RED)Cleaning up generated files...$(RESET)"
	@rm -f $(LOG_FILE) && echo "$(BOLD_ITALIC_GREEN)Cleaned up successfully!$(RESET)"

logs:
	@echo "$(BOLD_ITALIC_YELLOW)Displaying logs...$(RESET)"
	@cat $(LOG_FILE) 2> /dev/null || echo "$(BOLD_ITALIC_RED)No logs available!$(RESET)"

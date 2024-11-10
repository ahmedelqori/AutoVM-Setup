BOLD_ITALIC_RED     := \033[1;3;31m
BOLD_ITALIC_GREEN   := \033[1;3;32m
BOLD_ITALIC_YELLOW  := \033[1;3;33m
BOLD_ITALIC_BLUE    := \033[1;3;34m
BOLD_ITALIC_CYAN    := \033[1;3;36m
RESET               := \033[0m

IP := $(shell hostname -I | awk '{print $$1}')

all:  SERVER 

VBOX:
	@echo "$(BOLD_ITALIC_CYAN)Creating Virtual Machine...$(RESET)"
	@bash create_vbox.bash > /dev/null 2>&1

SERVER:
	@echo "$(BOLD_ITALIC_RED)Go to: \n\t$(BOLD_ITALIC_GREEN)http://$(IP):1337/install.yaml\n$(RESET)"
	@echo "$(BOLD_ITALIC_RED)Run this File:\n\tcurl -O $(BOLD_ITALIC_GREEN)http://$(IP):1337/packages.bash && sudo packages.bash$(RESET)"
	@python3 -m http.server 1337 > /dev/null 2>&1

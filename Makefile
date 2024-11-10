BOLD_ITALIC_RED     := \033[1;3;31m
BOLD_ITALIC_GREEN   := \033[1;3;32m
BOLD_ITALIC_YELLOW  := \033[1;3;33m
BOLD_ITALIC_BLUE    := \033[1;3;34m
BOLD_ITALIC_CYAN    := \033[1;3;36m

# BANNER := $(BOLD_ITALIC_YELLOW)"  __    __    _____    _____  _____    __    _     _     _____    "$(RESET) "\n" \
# 	$(BOLD_ITALIC_YELLOW)" /_/\  /\_\ /\_____\ /\_____\/\ __/\  /\_\  /_/\ /\_\   ) ___ (   "$(RESET) "\n" \
# 	$(BOLD_ITALIC_YELLOW)" ) ) \/ ( (( (_____/( (_____/) )  \ \ \/_/  ) ) ) ( (  / /\_/\ \  "$(RESET) "\n" \
# 	$(BOLD_ITALIC_YELLOW)"/_/ \  / \_\\ \__\   \ \__\ / / /\ \ \ /\_\/_/ / \ \_\/ /_/ (_\ \ "$(RESET) "\n" \
# 	$(BOLD_ITALIC_YELLOW)"\ \ \\// / // /__/_  / /__/_\ \ \/ / // / /\ \ \_/ / /\ \ )_/ / / "$(RESET) "\n" \
# 	$(BOLD_ITALIC_YELLOW)" )_) )( (_(( (_____\( (_____\) )__/ /( (_(  \ \   / /  \ \/_\/ /  "$(RESET) "\n" \
# 	$(BOLD_ITALIC_YELLOW)" \_\/  \/_/ \/_____/ \/_____/\/___\/  \/_/   \_\_/_/    )_____( "$(RESET) "\n" \

IP := $(shell hostname -I | awk '{print $$1}')

all: VBOX SERVER

VBOX:
	# @echo "$(BANNER)"
	@echo "$(BOLD_ITALIC_CYAN)Creating Virtual Machine...$(RESET)"
	@bash create_vbox.bash > /dev/null 2>&1

SERVER:
	@echo "$(BOLD_ITALIC_RED)Go to: \n\t$(BOLD_ITALIC_GREEN)http://$(IP):1337/install.yaml$(RESET)"
	@python3 -m http.server 1337 > /dev/null 2>&1

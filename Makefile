# Makefile for Rofi Logical Operators Selector
# Handles installation and uninstallation of the script

# Default installation prefix
PREFIX ?= /usr/local

# User-specific installation directory
USER_PREFIX ?= $(HOME)/.local

# Script name
SCRIPT_NAME = rofi_logical_operators.sh

# Installation paths
SYSTEM_BIN_DIR = $(DESTDIR)$(PREFIX)/bin
USER_BIN_DIR = $(USER_PREFIX)/bin

# Installation command
INSTALL = install
INSTALL_PROGRAM = $(INSTALL) -m 755

# Default target
.PHONY: all
all:
	@echo "Available targets:"
	@echo "  install        - Install system-wide (requires root privileges)"
	@echo "  user-install   - Install for current user only"
	@echo "  uninstall      - Uninstall system-wide installation"
	@echo "  user-uninstall - Uninstall user installation"

# System-wide installation (requires root privileges)
.PHONY: install
install:
	$(INSTALL) -d $(SYSTEM_BIN_DIR)
	$(INSTALL_PROGRAM) $(SCRIPT_NAME) $(SYSTEM_BIN_DIR)/rofi_logical_operators

# User-specific installation
.PHONY: user-install
user-install:
	$(INSTALL) -d $(USER_BIN_DIR)
	$(INSTALL_PROGRAM) $(SCRIPT_NAME) $(USER_BIN_DIR)/rofi_logical_operators

# System-wide uninstallation
.PHONY: uninstall
uninstall:
	rm -f $(SYSTEM_BIN_DIR)/rofi_logical_operators

# User-specific uninstallation
.PHONY: user-uninstall
user-uninstall:
	rm -f $(USER_BIN_DIR)/rofi_logical_operators

# Clean target (in case we add any generated files in the future)
.PHONY: clean
clean:
	@echo "Nothing to clean."

# Help target
.PHONY: help
help: all

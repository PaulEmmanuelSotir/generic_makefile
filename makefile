############################################################################################
################################## GENERIC MAKEFILE ########################################
############################################################################################
# TODO: hadnle extentions like .hpp, .cxx, ...

# Debug mode (comment this line to build project in release mode)
DEBUG = true

# Compiler
CC = g++
# Command used to remove files
RM = -rm -f
# Compiler and pre-processor options
CPPFLAGS = -Wall -std=c++17 -Ofast
# Debug flags
DEBUGFLAGS = -g
# Resulting program file name
EXE_NAME = prog
# The source file extentions
SRC_EXT = cpp
# The header file types
HDR_EXT = h

# Source directory
SRCDIR = source
# Headers directory
INCDIR = include
# Main output directory
OUTPUT_DIR = bin
# Release output directory
RELEASEDIR = release
# Debug output directory
DEBUGDIR = debug
# Dependency files directory
DEPDIR = dep
# Libraries (e.g. -L./antlr/runtime_source/dist/ -l:libantlr4-runtime.a)
LIBS = 
# List of include paths
INCLUDES = -I ./$(INCDIR)

ifdef DEBUG
BUILD_PATH = ./$(OUTPUT_DIR)/$(DEBUGDIR)
else
DEBUGFLAGS = 
BUILD_PATH = ./$(OUTPUT_DIR)/$(RELEASEDIR)
endif
# Source directory path
SRC_PATH = ./$(SRCDIR)
# Dependencies path
DEP_PATH = $(BUILD_PATH)/$(DEPDIR)

# List of source files
SOURCES = $(wildcard $(SRC_PATH)/*.$(SRC_EXT)) $(wildcard $(SRC_PATH)/**/*.$(SRC_EXT))
# List of object files
OBJS = $(SOURCES:$(SRC_PATH)/%.$(SRC_EXT)=$(BUILD_PATH)/%.o)
# List of dependency files
DEPS = $(SOURCES:$(SRC_PATH)/%.$(SRC_EXT)=$(DEP_PATH)/%.d)
# Source directories (VPATH is internally used by make)
VPATH := $(dir $(SOURCES))

.PHONY: all clean rebuild help

all: $(BUILD_PATH)/$(EXE_NAME)

clean:
	$(RM) $(BUILD_PATH) -r

rebuild: clean all

help:
	@echo '				### MAKEFILE HELP ###'
	@echo 'PHONY TARGETS:'
	@echo '	all 	...'
	@echo '	clean 	...'
	@echo '	rebuild ...'
	@echo '	help	...'

# Build object files
$(BUILD_PATH)/%.o: $(SRC_PATH)/%.$(SRC_EXT)
	mkdir -p $(dir $(DEPS)) $(dir $(OBJS))
	$(CC) $(CPPFLAGS) $(DEBUGFLAGS) $(INCLUDES) -MMD -MP -MF $(DEP_PATH)/$*.d -c $< -o $@

# Build main target
$(BUILD_PATH)/$(EXE_NAME): $(OBJS)
	$(CC) $(OBJS) -o $(BUILD_PATH)/$(EXE_NAME) $(LIBS)

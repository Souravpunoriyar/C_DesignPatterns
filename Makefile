# Directories containing source files
DIRS := test

# Compiler
CC := gcc
# Compiler flags
CFLAGS := -Wall -g

# Output executable
OUTPUT := test_out

# List of all source files
SRCS := $(wildcard $(addsuffix /*.c,$(DIRS)))

# Object files
OBJS := $(SRCS:.c=.o)
# Include directories (header search paths)
INCLUDES := $(addprefix -I,$(DIRS))

# Default target
all: $(OUTPUT)

# Rule to link the executable
$(OUTPUT): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

# Rule to compile C source files
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# PHONY target for cleaning up
clean:
	rm -f $(OBJS) $(OUTPUT)

# PHONY targets
.PHONY: all clean

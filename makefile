
CC=g++

ECHO=echo -e
RM=rm -f

CFLAGS=-std=c++11 -DLINUX

SRC_DIR=src
OBJ_DIR=obj
BIN_DIR=bin

VPATH+=$(OBJ_DIR)
VPATH+=$(SRC_DIR)

PROG_NAME=$(BIN_DIR)/tst

SRC=main.cpp
OBJS=$(SRC:.cpp=.o)
DEPS=$(SRC:.cpp=.d)

LIBS=-lm

.PHONY: all clean mkdir

all: mkdir $(PROG_NAME)

clean:
	@$(ECHO) "clean ..."
	@$(RM) $(OBJ_DIR)/*.o $(OBJ_DIR)/*.d
	@$(RM) $(PROG_NAME)
	@$(ECHO) "done"

mkdir:
	@mkdir -p bin obj

$(PROG_NAME): $(OBJS)
	@$(ECHO) "\nbuild $(@F) ..."
	$(CC) $(CFLAGS) $(addprefix $(OBJ_DIR)/,$(OBJS)) -o $(PROG_NAME) $(LIBS)

.SUFFIXES: .cpp .h .o .d

.cpp.o:
	@$(ECHO) "\nbuild $< ..."
	$(CC) -c $(CFLAGS) -MM -MF $(OBJ_DIR)/$*.d $<
	$(CC) -c $(CFLAGS) $< -o $(OBJ_DIR)/$*.o

-include $(addprefix $(OBJ_DIR)/,$(DEPS))

# eof

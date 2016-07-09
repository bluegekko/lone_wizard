SRC_ROOT_DIR := src
SRC_DIRS := \
	$(SRC_ROOT_DIR) \
	$(SRC_ROOT_DIR)/sdlwrapper
    
SOURCES := $(foreach subdir,$(SRC_DIRS),$(wildcard $(subdir)/*.cpp))
HEADERS := $(foreach subdir,$(SRC_DIRS),$(wildcard $(subdir)/*.hpp))
OBJS := $(SRCS:$(SRC_ROOT_DIR)/%.cpp=$(OBJ_ROOT_DIR)/%.o)
DEPS := $(SRCS:$(SRC_ROOT_DIR)/%.cpp=$(OBJ_ROOT_DIR)/%.d)
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))

#CC specifies which compiler we're using
CC = g++

#INCLUDES specifies the additional include paths we'll need
INCLUDES = -I.\3pp\SDL\mingw\i686-w64-mingw32\include\SDL2

#LIBRARY_PATHS specifies the additional library paths we'll need
LIBRARY_PATHS = -L.\3pp\SDL\mingw\i686-w64-mingw32\lib

#COMPILER_FLAGS specifies the additional compilation options we're using
# -w suppresses all warnings
# -Wl,-subsystem,windows gets rid of the console window
COMPILER_FLAGS = -w -Wl,-subsystem,windows

#LINKER_FLAGS specifies the libraries we're linking against
LINKER_FLAGS = -lmingw32 -lSDL2main -lSDL2

#OBJ_NAME specifies the name of our exectuable
OBJ_NAME = TheLoneWizard.exe

#This is the target that compiles our executable
all : $(SOURCES)
	$(CC) $(SOURCES) $(INCLUDES) $(LIBRARY_PATHS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)

main.exe: $(OBJ_FILES)
	$(CC) $(LINKER_FLAGS) -o $@ $^

obj/%.o: src/%.cpp
	$(CC) $(COMPILER_FLAGS) -c -o $@ $<

# Dependency generation
COMPILER_FLAGS += -MMD
-include $(OBJFILES:.o=.d)
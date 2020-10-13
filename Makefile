TARGET    := demo
BUILD_DIR := build

SRC_FILES := \
	main

OBJS := $(addsuffix .o, $(SRC_FILES))


#compile and lib parameter

CC        := gcc
CXX       := g++
LIBS      +=
LDFLAGS   +=
DEFINES   +=
INCLUDE   += -I.
CFLAGS    += -g -Wall -O2 $(DEFINES) $(INCLUDE)
CXXFLAGS  += $(CFLAGS) -std=c++11

#private, please don't amend

.PHONY : all clean

all : $(TARGET)

$(TARGET) : $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS) $(LIBS)
	@echo "LD   $@"
%.o : %.c
	$(CC) $(CFLAGS) -c $^ -o $@
	@echo "CC   $@"
%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@
	@echo "CXX  $@"

clean :
	-rm -rf $(OBJS) $(TARGET)
  

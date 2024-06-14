PREFIX ?= /usr/local
LUA_INCLUDE_DIR ?= $(PREFIX)/include
LUA_LIB_DIR ?= $(PREFIX)/lib/lua/$(LUA_VERSION)
INSTALL ?= install
SHELL := /bin/bash

.PHONY: all install

all: ;

install: all
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/rndname/
	$(INSTALL) lib/*.lua $(DESTDIR)$(LUA_LIB_DIR)/rndname/

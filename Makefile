SHELL := /bin/bash

unameOut := $(shell uname -s)

ifeq ($(unameOut),Linux)
    data := $(HOME)/.local/share
else ifeq ($(unameOut),Darwin)
    data := $(HOME)/Library/Application\ Support
else ifeq ($(unameOut),CYGWIN*)
    data := %APPDATA%
else ifeq ($(unameOut),MINGW*)
    data := %APPDATA%
else ifeq ($(unameOut),MSYS_NT*)
    data := %APPDATA%
else
    $(error unknown os)
endif

data := $(data)/typst/packages/docs
bmstu_package := $(data)/bmstu/0.1.1

.PHONY: all install
all: install

install: create_dir copy_files

create_dir:
	@mkdir -p $(bmstu_package)

copy_files:
	@cp -r $(dir $(lastword $(MAKEFILE_LIST)))bmstu/* $(bmstu_package)

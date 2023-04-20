.ONESHELL:
SHELL = /bin/bash

.PHONY : all
## all: runs all targets except help
all : env html clean

.PHONY : env 
## env: creates and configures the environment
env :
	source /srv/conda/etc/profile.d/conda.sh
	conda env create -f environment.yml 
	conda activate final_proj
	conda install ipykernel
	python -m ipykernel install --user --name final_proj --display-name "IPython - final_proj"

.PHONY : html 
## html: build the JupyterBook normally
html: 
	jupyter-book build . 

.PHONY : clean
## clean: clean up the figures, audio and _build folders
clean: 
	rm -rf figures/*
	rm -rf _build/*

.PHONY : help
## help: prints documentation
help : Makefile
	@sed -n '/^##/p' $<
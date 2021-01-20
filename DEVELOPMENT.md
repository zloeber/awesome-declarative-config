## Development 

This document will cover how this list is generated and how you can setup a local development environment. This guide assumes you have Python3, make, and are using a Linux/Mac/WSL environment.

Most tools used in this list are purposefully declarative in nature and are able to be run via standalone tooling. Once you have cloned this repository to your workstation you should be able to use the included `Makefile` for most local tasks.

```bash
# Setup the local tools for further tasks 
make deps

# Build and preview the website (http://localhost:8000 by default)
make serve

# Just build the local website (target path == ./site)
make build

# Publish the site to github pages
make publish

# validate the list.yml file
make validate

```

You can view additional tasks by running `make` without any arguments.
Latex (TeXLive) docker container
=====

[![Docker Build Status](https://img.shields.io/docker/build/jgoldfar/latex-docker.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/latex-docker.svg)](https://hub.docker.com/r/jgoldfar/latex-docker/)
[![Build Status](https://travis-ci.org/jgoldfar/latex-docker.svg?branch=master)](https://travis-ci.org/jgoldfar/latex-docker)

This container helps with compilation of latex sources without the need to install all latex packages on your system.

This repository is forked from blang's repository in order to add other packages needed for a CI setup.

Setup
-----
First, add your local user to docker group:

```shell
sudo usermod -aG docker YOURUSERNAME
```

build:

```shell
docker build -t jgoldfar/latex-docker .

```

Usage:
-----

```shell
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)":/data jgoldfar/latex-docker:debian-latest

# Or better in one go (does not start container twice)
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)":/data jgoldfar/latex-docker:debian-latest /bin/sh -c "pdflatex example.tex && pdflatex example.tex"

# View
./example.pdf
```

Called this way, your working directory would be mounted to `/data` inside container.

Why should I use this container?

-----

- Easy setup
- In the Debian-based images, `chktex` and `pgf` packages are explicitly installed to ensure they are always available.
- The Alpine images are quite small.

## Container Descriptions

* `debian` is the "legacy" image containing the complete TeXLive installation on top of Debian Stretch. Previous iterations of this repo called this `default`.

* `debian-minimal` is a minimal Debian image containing just TeX & LaTeX, but very few other packages.

* `debian-minplus` includes some additional packages on top of `debian-minimal`, primarily for typesetting mathematics.

* `alpine-minimal` is an Alpine 3.9 image with a working TeX + LaTeX installation, as in `debian-minimal`

* `alpine-minplus` includes some additional packages on top of `alpine-minimal`, primarily for typesetting mathematics.

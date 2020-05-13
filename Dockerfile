# ===========================================================================================
# Dockerfile for building yocto linux filesystem for Hermes
#
# References:
# https://github.com/gmacario/easy-build/blob/master/build-aosp/Dockerfile
# ===========================================================================================

#############################################
# Dockerfile stage for base build environment
#############################################

# Utilizing Docker Multi-stage Builds to make Dockerfile definitions cleaner by
#  subsequent steps all inheriting from the common base environment 'build-env'.
# https://docs.docker.com/develop/develop-images/multistage-build/
FROM ubuntu:16.04 as build-env
LABEL maintainer="Tyler Arnold <tyler@mac.com>"

# /bin/sh points to Dash by default, need bash for yocto builds
SHELL ["/bin/bash", "-c"]

# install Rustup 
RUN curl https://sh.rustup.rs -sSf | sh


RUN rustup target add armv7-unknown-linux-gnueabihf

RUN sudo apt-get install gcc-4.7-multilib-arm-linux-gnueabihf
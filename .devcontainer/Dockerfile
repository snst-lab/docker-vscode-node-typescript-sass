FROM alpine:latest

# Configure apt and install packages
RUN RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    bash \
    npm \
    nodejs \
    git
WORKDIR /home
SHELL ["/bin/bash", "-c"]
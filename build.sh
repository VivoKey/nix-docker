#!/usr/bin/env bash

nix build .#dockerImage && docker load < result && docker push vivokey/nix-docker:latest

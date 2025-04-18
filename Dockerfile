FROM nixos/nix:latest

ENV NIX_CONFIG="experimental-features = nix-command flakes"

RUN nix-build -A bash '<nixpkgs>' && \
    nix-build -A skopeo '<nixpkgs>'

WORKDIR /drone/src

ENTRYPOINT [ "/usr/bin/env", "bash" ]
FROM nixos/nix:latest

ENV NIX_CONFIG="experimental-features = nix-command flakes"

RUN nix profile install nixpkgs#skopeo

WORKDIR /drone/src

ENTRYPOINT [ "/usr/bin/env", "bash" ]
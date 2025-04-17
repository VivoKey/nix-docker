{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in
    {
      packages.x86_64-linux.dockerImage = pkgs.dockerTools.buildImage {
        name = "vivokey/nix-docker";
        tag = "latest";
        created = "now";
        copyToRoot = with pkgs; [
          nix
          docker
        ];
        config = {
          Env = [
            "NIX_CONFIG=experimental-features = nix-command flakes"
          ];
        };
      };
    };
}

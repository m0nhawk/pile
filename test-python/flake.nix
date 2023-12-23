{
  description = "A flake for building Hello World";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      name = "hello";
      src = ./.;
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) stdenv;
    in
    {
      packages.${system}.default = stdenv.mkDerivation {
        inherit system name src;
        buildInputs = [ 
          pkgs.python39
          pkgs.git
          pkgs.openssl
          pkgs.python39Packages.pip
          pkgs.uwsgi
          pkgs.python39Packages.virtualenv
          pkgs.poetry
        ];
      };
      app = pkgs.poetry2nix.mkPoetryApplication {
        projectDir = ./.;
        python = pkgs.python39;
      };
    };
}

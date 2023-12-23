{
  description = "A flake for building Hello World";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      name = "main";
      src = ./.;
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) stdenv;
    in
    {
      packages.${system}.default = stdenv.mkDerivation {
        inherit system name src;
        buildInputs = [ 
          pkgs.crystal
        ];
        buildPhase = "
          crystal build ${src}/main.cr
        ";
        installPhase = "mkdir -p $out/bin; install -t $out/bin main";
      };
    };
}

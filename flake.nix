{

  inputs = {
    self.submodules = true;

    nix-haskell.url = ./deps/nix-haskell;

    nixpkgs.follows = "nix-haskell/nixpkgs";
    flake-compat.follows = "nix-haskell/flake-compat";
  };

  outputs = inputs@{ self, ... }:
    let nixpkgs = if inputs ? "nixpkgs" then inputs.nixpkgs else builtins.getFlake "nixpkgs";
        eachSystem = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in {
      packages = eachSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
            project = import ./default.nix { inherit inputs system pkgs; };
        in project
      );

      devShells = eachSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
            shell = import ./shell.nix { inherit inputs system pkgs; };
        in {
          default = shell;
        }
      );
    };
}

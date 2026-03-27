{

  inputs = {
    self.submodules = true;

    nix-haskell.url = "path:./deps/nix-haskell";

    nixpkgs.follows = "nix-haskell/nixpkgs";
  };

  outputs = inputs@{ self, ... }:
    let nixpkgs = if inputs ? "nixpkgs" then inputs.nixpkgs else builtins.getFlake "nixpkgs";
        eachSystem = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in {
      packages = eachSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
            project = import ./default.nix { inherit pkgs; };
        in project
      );
    };
}

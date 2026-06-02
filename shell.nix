{ inputs ? (import ./inputs.nix)
, system ? builtins.currentSystem
, pkgs ? (import inputs.nixpkgs { inherit system; })
}:

let project = import ./nix-haskell.nix { inherit inputs system pkgs; };

in project.project.haskell-nix.project.shell

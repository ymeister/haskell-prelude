{ pkgs ? import <nixpkgs> {}
, system ? (pkgs.system or builtins.currentSystem)
, inputs ? {}
}:

let project = import ./nix-haskell.nix { inherit pkgs inputs; };

in project.project.haskell-nix.project.shell

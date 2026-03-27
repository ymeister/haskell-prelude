{ pkgs ? import <nixpkgs> {} }:

{

  nix-haskell = import ./nix-haskell { inherit pkgs; };

  nixpgks = {
    project = pkgs.callPackage project-nixpkgs.project { inherit pkgs };
    overlay = pkgs.callPackage project-nixpkgs.overlay { inherit pkgs };
  };

}

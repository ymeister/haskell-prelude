{ inputs ? (import ./inputs.nix)
, system ? builtins.currentSystem
, pkgs ? (import inputs.nixpkgs { inherit system; })
}:

{

  nix-haskell = import ./nix-haskell { inherit inputs system pkgs; };

  #nixpgks = {
  #  project = pkgs.callPackage project-nixpkgs.project { inherit pkgs; };
  #  overlay = pkgs.callPackage project-nixpkgs.overlay { inherit pkgs; };
  #};

}

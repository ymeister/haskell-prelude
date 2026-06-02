{ inputs ? (import ./inputs.nix)
, system ? builtins.currentSystem
, pkgs ? (import inputs.nixpkgs { inherit system; })
}:

with pkgs;

{

  project = haskellPackages.callCabal2nix "prelude" ./. {};

  overlay = writeScriptBin "with-prelude-overlay" ''
    #!/bin/sh

    export NIX_PATH="$NIX_PATH:nixpkgs-overlays=${./.}/overlay"

    exec "$@"
  '';

}



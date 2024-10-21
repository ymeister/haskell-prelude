{ pkgs ? import <nixpkgs> {} }:

with pkgs;

writeScriptBin "with-prelude-overlay" ''
  #!/bin/sh

  export NIX_PATH="$NIX_PATH:nixpkgs-overlays=${./.}/overlay"

  exec "$@"
''

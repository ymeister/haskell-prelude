{ pkgs ? import <nixpkgs> {}
, system ? (pkgs.system or builtins.currentSystem)
, inputs ? {}
}:

let nix-haskell-src = inputs.nix-haskell or ./deps/nix-haskell;
    nix-haskell = import nix-haskell-src { inherit system; };
    cabal-lib = import (nix-haskell-src + "/libs/cabal.nix") { inherit pkgs; };

in rec {

  project = nix-haskell {
      name = "prelude";
      src = ./.;
      cabalProject = cabal-lib.inline-cabal-project ./. "cabal.project";
    };

  overlay = import ./overlay/nix-haskell.nix;

}

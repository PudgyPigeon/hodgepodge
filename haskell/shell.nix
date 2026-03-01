{ pkgs ? import <nixpkgs> {} }:

let
  project = import ./default.nix { inherit pkgs; };
in
  pkgs.mkShell {
    inputsFrom = [ project.haskellPkg ];

    buildInputs = [
      pkgs.haskellPackages.cabal-install
      pkgs.haskellPackages.haskell-language-server
      pkgs.haskellPackages.ghcid # use instead of 'ghc' for autoreload on ctrl+s
    ];
  }
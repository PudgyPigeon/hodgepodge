{ pkgs ? import <nixpkgs> {} }:


let 
  haskellVersion = pkgs.haskell.packages.ghc910;
  haskellPkg = haskellVersion.developPackage {
    root = ./.;
    modifier = drv: pkgs.haskell.lib.addBuildTools drv [
      pkgs.zlib
      pkgs.pkg-config
    ];
  };
in
{
  inherit haskellVersion haskellPkg;
}
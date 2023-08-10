{pkgs ? import <nixpkgs> {}}: let
  # dumpasn1 = pkgs.callPackage ./default.nix { };
  mkosi = pkgs.callPackage ./mkosi.nix {};
in
  pkgs.mkShell {
    nativeBuildInputs = [mkosi];
  }

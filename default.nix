{ pkgs ? import <nixpkgs> { } }:

let
  rndname = pkgs.callPackage ./package.nix { };
in
{
  inherit rndname;

  default = rndname;
}

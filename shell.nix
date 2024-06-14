{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.lua
  ];

  shellHook = ''
    export LUA_PATH="$LUA_PATH;$PWD/lib/?.lua"
  '';
}

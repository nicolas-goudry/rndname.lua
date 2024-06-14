{
  description = "Lua library to generate random names";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-formatter-pack.url = "github:Gerschtli/nix-formatter-pack";
    nix-formatter-pack.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nix-formatter-pack, ... }:
    let
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = f: nixpkgs.lib.genAttrs systems f;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.callPackage ./shell.nix { };
        });

      formatter = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        nix-formatter-pack.lib.mkFormatter {
          inherit pkgs;

          config.tools = {
            deadnix.enable = true;
            nixpkgs-fmt.enable = true;
            statix.enable = true;
          };
        });

      packages = forAllSystems (system:
        import ./. {
          pkgs = import nixpkgs { inherit system; };
        });
    };
}

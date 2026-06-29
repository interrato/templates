{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      forAllSystems =
        packagesFn:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system: packagesFn nixpkgs.legacyPackages.${system}
        );
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            (python3.withPackages (python-pkgs: with python-pkgs; [ numpy ]))
            ruff
            ty
          ];
        };
      });
    };
}

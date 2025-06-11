{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs =
    { nixpkgs, systems, ... }:
    let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devShells = eachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            name = "typst";
            packages = with pkgs; [
              tinymist
              typst
              typstyle
            ];
          };
        }
      );
    };
}

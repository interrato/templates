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
            name = "rust";
            packages = with pkgs; [
              cargo
              rustc
              rustfmt
              rustPackages.clippy
              rust-analyzer
            ];
            RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
          };
        }
      );
    };
}

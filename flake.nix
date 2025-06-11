{
  description = "Simone's Nix flake templates";

  outputs =
    { self }:
    {
      templates = {
        go = {
          description = "Go template";
          path = ./go;
          welcomeText = ''
            # Getting Started
            - Run `go mod init <module-path>` to initialize a new project
            - Run `go run .` to run the project
          '';
        };

        python = {
          description = "Python template";
          path = ./python;
        };

        rust = {
          description = "Rust template";
          path = ./rust;
          welcomeText = ''
            # Getting Started
            - Run `cargo init` to initialize a new project
            - Run `cargo run` to run the project
          '';
        };

        typst = {
          description = "Typst template";
          path = ./typst;
          welcomeText = ''
            # Getting Started
            - Start editing `document.typ`
          '';
        };
      };
    };
}

{
  description = "Simone's Nix flake templates";

  outputs =
    { self }:
    {
      templates = {
        c = {
          description = "C/C++ template";
          path = ./c;
        };

        go = {
          description = "Go template";
          path = ./go;
        };

        python = {
          description = "Python template";
          path = ./python;
        };

        typst = {
          description = "Typst template";
          path = ./typst;
        };
      };
    };
}

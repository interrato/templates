## Nix templates

My personal [Nix](https://wiki.nixos.org/wiki/Nix) templates.

### Usage

To initialize a new project in the current directory use

    nix flake init -t github:interrato/templates#<template>

To create a new project in the specified directory use

    nix flake new -t github:interrato/templates#<template> <dir>

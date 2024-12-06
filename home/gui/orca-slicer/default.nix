{ inputs, config, pkgs, lib, nixpkgs, ... }:
{
  home.packages = [
    pkgs.orca-slicer
    pkgs.webkitgtk
  ];
}

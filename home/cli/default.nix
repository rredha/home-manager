{ inputs, config, pkgs, lib, ... }:
{
 imports = [
    ./git
    ./bash
    ./git
    ./kitty
    ./neovim
    ./tmux
    ./starship
    ./lynx
    ./mpv
 ];
}

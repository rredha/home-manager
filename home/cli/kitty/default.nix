{ pkgs, lib, ... }:
{
    programs.kitty = {
      font = {
        name = "proggy";
        package = pkgs.proggyfonts;
        size = 14;
      };
    };
}

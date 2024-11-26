{inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./autocommands.nix
    ./options.nix
    ./completion.nix
    ./keymappings.nix
    ./plugins
  ];

 programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    colorschemes.oxocarbon.enable = true;
    plugins.web-devicons.enable = true;
 };

    # Colorschemes To try
         #base16
         #everforest
         #modus
         #poimondres

}

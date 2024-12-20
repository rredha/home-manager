{ inputs, config, pkgs, lib, nixpkgs, ... }:

  let
  neovimconfig = import ./nixvim;
  nvim = inputs.nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
    inherit pkgs;
    module = neovimconfig;
  };

  in
{
  home.username = "redha";
  home.homeDirectory = "/home/redha";

  # Importing necessary modules
 imports = [
    ./cli
    ./gui
    ./fonts.nix
 ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.preferXdgDirectories = true;
  # XDG configuration
  xdg.userDirs = {
   enable = true;
   createDirectories = true;

   desktop = "/home/redha/toSort";
   documents = "/home/redha/docs";
   download = "/home/redha/dwn";
   music = "/home/redha/audio";
   pictures = "/home/redha/imgs";
   videos = "/home/redha/vids";
   templates = "/home/redha/recipe";
   publicShare = "/home/redha/share";
  };


  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
      unityhub
      orca-slicer
      transmission_4
      qutebrowser
      brave
      simple-scan
      zotero
      freecad
      kicad
      pavucontrol
      zathura
      fzf
      obsidian
      ripgrep
      lynx
      tree
      tldr
      starship
      gh
      glow
      yt-dlp
      neofetch
      kitty
      mpv
      flameshot
  ];


  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/redha/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}

{ pkgs , ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            bash
            lua
            make
            markdown
            nix
            regex
            vim
            vimdoc
            yaml
          ];
      nixvimInjections = true;

      folding = true;
      settings = {
        indent = {
          enable = true;
        };
      };
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}

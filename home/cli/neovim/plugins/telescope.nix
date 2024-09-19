{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        # Find files using Telescope command-line sugar.
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fo" = "oldfiles";

        # Buffers
        "<leader>b" = "buffers";

        # Help
        "<leader>h" = "help_tags";

        # Diagnostics
        "<leader>d" = "diagnostics";

        # Git
        "<leader>" = "git_files";

      };

      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        set_env.COLORTERM = "truecolor";
      };
    };
  };
}

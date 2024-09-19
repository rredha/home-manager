{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = ",";
      maplocalleader = ",";
    };

    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "<Space>" = "<NOP>";

          # Esc to clear search results
          "<esc>" = ":noh<CR>";

          # navigate to left/right window
          "<leader>t" = ":bn";
          "<leader>s" = ":bp";

          # close buffer
          "<leader>q" = ":bd";

          # resize with arrows
          "<C-Up>" = ":resize -2<CR>";
          "<C-Down>" = ":resize +2<CR>";
          "<C-Left>" = ":vertical resize +2<CR>";
          "<C-Right>" = ":vertical resize -2<CR>";

          # obsidian specific mappings
          # To Do, check how to move them to obsidian.nix
          "<leader>on" = ":ObsidianNew<CR>";
          "<leader>os" = ":ObsidianSearch<CR>";
          "<leader>ot" = ":ObsidianTemplate<CR>";


          # move current line up/down
          # A = Alt key
          "<A-k>" = ":move-2<CR>";
          "<A-j>" = ":move+<CR>";
        };
      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {
          # better indenting
          ">" = ">gv";
          "<" = "<gv";
          "<TAB>" = ">gv";
          "<S-TAB>" = "<gv";

          # move selected line / block of text in visual mode
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
        };
    in
      config.nixvim.helpers.keymaps.mkKeymaps
      {options.silent = true;}
      (normal ++ visual);
  };
}

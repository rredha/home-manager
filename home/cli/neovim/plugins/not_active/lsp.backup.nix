{self, ...} :
{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
    };
    cmp_luasnip.enable = true;

    cmp-nvim-lsp-signature-help.enable = true;

    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-cmdline.enable = true;
    cmp-cmdline-history.enable = true;
    # cmp-nvim-lsp.enable = true;
  };

  plugins.cmp-nvim-lsp = {
    enable = true;

   # Does not work, seems like an old version
   # Check Gaetan Lepage Config.

   #sources = [
   #  {name = "nvim_lsp";}
   #  {name = "path";}
   #  {name = "buffer";}
   #];

   #mapping = {
   #  "<CR>" = "cmp.mapping.confirm({ select = true })";
   #  "<TAB>" = {
   #    action = ''
   #      function(fallback)
   #        if cmp.visible() then
   #          cmp.select_next_item()
   #        elseif luasnip.expandable() then
   #          luasnip.expand()
   #        elseif luasnip.expand_or_jumpable() then
   #          luasnip.expand_or_jump()
   #        elseif check_backspace() then
   #          fallback()
   #        else
   #          fallback()
   #        end
   #      end
   #    '';
   #    modes = [ "i" "s" ];
   #  };
   #};
  };

  plugins.lsp = {
    enable = true;
    servers = {
      omnisharp.enable = true;
      cmake.enable = true;
      ccls.enable = true;
    };
  };


}

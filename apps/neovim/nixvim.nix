{
  config,
  pkgs,
  nixvim,
  ...
}:

{
  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    colorschemes.onedark.enable = true;

    globals = {
      mapleader = " ";
      maplocalLeader = " ";
    };

    options = {
      clipboard = "unnamedplus";
      expandtab = true;
      fileencoding = "utf-8";
      mouse = "a";
      number = true;
      relativenumber = true;
      signcolumn = "number";
      shiftwidth = 2;
      tabstop = 2;
      termguicolors = true;
      updatetime = 300;
    };

    plugins = {

      # akinsho/bufferline.nvim: a snazzy buffer line with tabpage integration
      # requires Neovim 8+, a nerd font, a colorscheme, and vim.o.termguicolors=true
      bufferline.enable = true;

      # hrsh7th/cmp-buffer: cmp for buffer words
      # recommended for nvim-cmp
      cmp-buffer.enable = true;

      # hrsh7th/cmp-cmdline
      # recommended for nvim-cmp
      cmp-cmdline.enable = true;

      # saadparwaiz1/cmp_luasnip
      # recommended for nvim-cmp
      cmp_luasnip.enable = true;

      # hrsh7th/cmp-nvim-lsp: source for neovim's built-in language server client
      # recommended for nvim-cmp
      cmp-nvim-lsp.enable = true;

      # hrsh7th/cmp-path
      # recommended for nvim-cmp
      cmp-path.enable = true;

      # terrortylor/nvim-comment: toggles comments by filetype
      # defaults
      #   gcc toggle commenting current line
      #   gc{motion} toggle commmenting selection
      comment-nvim.enable = true;

      # tpope/vim-fugitive: Git commands from within vim
      # :Git
      fugitive.enable = true;

      # neovim builtin LSP
      lsp = {
        enable = true;

        servers = {
          elixirls = {
            enable = true;
          };

          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
          };

          rust-analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
        };
      };

      # nvim-lualine/lualine: lua statusline
      lualine.enable = true;

      # L3MON4D3/LuaSnip: snippets
      luasnip.enable = true;

      # hrsh7th/nvim-cmp: a completion engine for neovim written in Lua
      # recommended
      #   neovim/nvim-lspconfig
      #   hrsh7th/cmp-nvim-lsp
      #   hrsh7th/cmp-buffer
      #   hrsh7th/cmp-path
      #   hrsh7th/cmp-cmdline
      #   hrsh7th/nvim-cmp
      #   L3MON4D3/LuaSnip
      #   saadparwaiz1/cmp_luasnip
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';
            modes = [
              "i"
              "s"
            ];
          };
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
        snippet.expand = "luasnip";
      };

      # stevearc/oil.nvim: a vim-vinegar-like file explorer that lets you edit the filesystem
      oil.enable = true;

      # nvim-telescope/telescope.nvim: a highly extendable fuzzy finder over lists
      telescope = {
        enable = true;
        defaults.file.ignore_patterns = [ "^.git/" ];
        # use fzf
        extensions.fzf-native = {
          enable = true;
          caseMode = "smart_case";
          fuzzy = true;
          overrideFileSorter = true;
          overrideGenericSorter = true;
        };
      };

      # nvim-treesitter/nvim-treesitter: interface for tree-sitter highlighter
      treesitter = {
        enable = true;
        indent = true;
      };

      # LnL7/vim-nix: support for writing Nix expressions in vim
      nix.enable = true;

      # folke/which-key.nvim: display popup of possible key bindings of command being typed
      which-key.enable = true;
    };
  };
}

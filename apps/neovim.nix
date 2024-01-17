{ config, pkgs, ... }:

{
  programs.neovim =
    let
      toLua = str: ''
        lua << EOF
        ${str}
        EOF
      '';
      toLuaFile = file: ''
        lua << EOF
        ${builtins.readFile file}
        EOF
      '';
    in
    {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        fd
        fzf
        lua-language-server
        ripgrep
        rnix-lsp
        tree-sitter
      ];

      extraLuaConfig = ''
        ${builtins.readFile ./nvim/options.lua}
      '';

      plugins = with pkgs.vimPlugins; [

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./nvim/plugin/lsp.lua;
        }

        {
          plugin = comment-nvim;
          config = toLua ''require("Comment").setup()'';
        }

        {
          plugin = onedark-nvim;
          config = "colorscheme onedark";
        }

        neodev-nvim

        nvim-cmp
        {
          plugin = nvim-cmp;
          config = toLuaFile ./nvim/plugin/cmp.lua;
        }

        {
          plugin = telescope-nvim;
          config = toLuaFile ./nvim/plugin/telescope.lua;
        }

        telescope-fzf-native-nvim

        cmp_luasnip
        cmp-nvim-lsp

        luasnip
        friendly-snippets

        lualine-nvim
        nvim-web-devicons

        {
          plugin = (
            nvim-treesitter.withPlugins (
              p: [
                p.tree-sitter-nix
                p.tree-sitter-vim
                p.tree-sitter-lua
              ]
            )
          );
          config = toLuaFile ./nvim/plugin/treesitter.lua;
        }

        vim-nix
      ];
    };
}

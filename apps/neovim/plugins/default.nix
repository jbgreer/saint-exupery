{
  imports = [
    ./barbar.nix
    ./comment.nix
    ./dap.nix
    ./elixirls.nix
    ./floaterm.nix
    ./fugitive.nix
    ./lsp.nix
    ./lua-ls.nix
    ./lualine.nix
    ./markdown-preview.nix
    ./neorg.nix
    ./neo-tree.nix
    ./rust-analyzer.nix
    ./startify.nix
    ./tagbar.nix
    ./telescope.nix
    ./treesitter.nix
    ./vimtex.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    colorschemes.onedark.enable = true;

    plugins = {
      gitsigns = {
        enable = true;
        signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      oil.enable = true;
    };
  };
}

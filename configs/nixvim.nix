{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
    plugins.telescope.enable = true;
    plugins.which-key.enable = true;
    plugins.treesitter.enable = true;
    plugins.nvim-tree.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.barbar.enable = true;
    plugins.vim-matchup.enable = true;
    plugins.indent-blankline.enable = true;
    plugins.notify.enable = true;

    opts = {
      number = true;
      undodir = "/home/cj/.local/share/nvim/undo";
      undofile = true;
    };
    plugins.lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
      };
    };

    plugins.cmp-nvim-lsp.enable = true;
    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
    };

    plugins.web-devicons.enable = true;

    globals.mapleader = " ";

    keymaps = [
      {
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<cr>";
        options.desc = "Toggle Tree";
      }

      {
        key = "<S-h>";
        action = "<cmd>BufferPrevious<cr>";
        options.desc = "Previous tab";
      }

      {
        key = "<S-l>";
        action = "<cmd>BufferNext<cr>";
        options.desc = "Next tab";
      }

      {
        key = "<Tab>";
        action = "<cmd>lua require'cmp'.select_next_item()<cr>";
        options.desc = "Select Next Completion";
      }

      {
        key = "<S-Tab>";
        action = "<cmd>lua require'cmp'.select_prev_item()<cr>";
        options.desc = "Select Previous Completion";
      }

      {
        key = "<CR>";
        action = "<cmd>lua require'cmp'.confirm({ select = true })<cr>";
        options.desc = "Confirm Completion";
      }
    ];


  extraConfigLua = ''
      local cmp = require'cmp'

      cmp.setup({
        mapping = {
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })

      -- Auto-format Rust files using rustfmt
      vim.cmd([[
        augroup RustFmt
          autocmd!
          autocmd BufWritePre *.rs lua vim.lsp.buf.format({ async = false })
        augroup END
      ]])
    '';

  };
}


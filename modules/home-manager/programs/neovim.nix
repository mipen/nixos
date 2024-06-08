{ pkgs, lib, config, modulesPath, ... }: {

  options = { neovim.enable = lib.mkEnableOption "enables neovim"; };

  config = lib.mkIf config.neovim.enable {
    programs = {
      neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        withNodeJs = true;
        extraPackages = with pkgs; [
          lua-language-server
          gopls
          xclip
          wl-clipboard
          luajitPackages.lua-lsp
          nil
          rust-analyzer
          nodePackages.bash-language-server
          yaml-language-server
          pyright
          marksman
        ];
        plugins = with pkgs.vimPlugins; [
          alpha-nvim
          auto-session
          bufferline-nvim
          dressing-nvim
          indent-blankline-nvim
          nvim-treesitter.withAllGrammars
          lualine-nvim
          nvim-autopairs
          nvim-web-devicons
          nvim-cmp
          nvim-surround
          nvim-lspconfig
          cmp-nvim-lsp
          cmp-buffer
          luasnip
          cmp_luasnip
          friendly-snippets
          lspkind-nvim
          comment-nvim
          nvim-ts-context-commentstring
          # {
          #  plugin = catppuccin-nvim;
          #  config = "colorscheme catppuccin";
          #}
          {
            plugin = nord-nvim;
            config = "colorscheme nord";
          }
          plenary-nvim
          neodev-nvim
          luasnip
          telescope-nvim
          todo-comments-nvim
          nvim-tree-lua
          telescope-fzf-native-nvim
          vim-tmux-navigator
        ];
        extraConfig = ''
          set noemoji
        '';
        extraLuaConfig = ''
          ${builtins.readFile (modulesPath + config/nvim/options.lua)}
          ${builtins.readFile ../../../config/nvim/keymaps.lua}
          ${builtins.readFile ../../../config/nvim/plugins/alpha.lua}
          ${builtins.readFile ../../../config/nvim/plugins/autopairs.lua}
          ${builtins.readFile ../../../config/nvim/plugins/auto-session.lua}
          ${builtins.readFile ../../../config/nvim/plugins/comment.lua}
          ${builtins.readFile ../../../config/nvim/plugins/cmp.lua}
          ${builtins.readFile ../../../config/nvim/plugins/lsp.lua}
          ${builtins.readFile ../../../config/nvim/plugins/nvim-tree.lua}
          ${builtins.readFile ../../../config/nvim/plugins/telescope.lua}
          ${builtins.readFile ../../../config/nvim/plugins/todo-comments.lua}
          ${builtins.readFile ../../../config/nvim/plugins/treesitter.lua}
          require("ibl").setup()
          require("bufferline").setup{}
          require("lualine").setup({
            icons_enabled = true,
            theme = 'dracula',
          })
        '';
      };
    };
  };
}

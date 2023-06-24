{ pkgs, ... }:

{
    environment.variables = { EDITOR = "vim"; };

    environment.systemPackages = with pkgs; [
        ((vim_configurable.override { }).customize{
            name = "vim";

            vimrcConfig.packages.plugins = with pkgs.vimPlugins; {
                start = [ vim-nix ];
                opt = [];
            };

            vimrcConfig.customRC = ''
                syntax on
                set tabstop=4
                set shiftwidth=4 smarttab
                set expandtab
                set noswapfile
                set incsearch 
                set noerrorbells
                set smartindent
                set number
                set relativenumber
                set nobackup
                set scrolloff=8
                set sidescrolloff=8
                set fileencoding='utf-8'
                set nohlsearch
            '';
        })
    ];
}

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    firefox
    neofetch
    tree
  ];
}


{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    clang-tools
    gnumake
  ];
}


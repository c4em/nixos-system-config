{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdenlive
  ];
}


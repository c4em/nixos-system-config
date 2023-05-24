{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    krita
    gimp
  ];
}


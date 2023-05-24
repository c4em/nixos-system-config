{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kate
  ];
}

{ config, pkgs, ... }:

{
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
}


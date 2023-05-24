{ config, pkgs, ... }:
{
  imports = [
  ];

  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [
      "wheel" 
      "networkmanager"
      "audio"
      "video"
      "docker"
      "plugdev"
    ];
  };

  # Set to false to disable sudo password prompt
  security = {
    sudo.wheelNeedsPassword = true;
  };

#  home-manager.users.user = {
#    home.stateVersion = "22.11";
#  };

  # programs.home-manager.enable = true;
}


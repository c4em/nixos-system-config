# Master configuration file
{ config, pkgs, ... }:
let
  # User configurations are stored under ./user/[username].nix
  # Set the corresponding value in ./username.nix
  user = import ./username.nix;
in
{
  imports = [
    ./users/${user}.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Uncomment the profile you want to use
    ./profiles/workstation.nix
  ];

  # General NixOS configuration
  nix = {
    settings.auto-optimise-store = true;
    # Automatically remove generations older than a week
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Use the unstable channel
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05";
}


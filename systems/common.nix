# Common configuration for all systems

{  ... }:

{
    nix = {
        settings.auto-optimise-store = true;

        # Clean generations older than a week
        gc = {
            automatic = false; # Flip this to do it automatically
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "23.05";
}

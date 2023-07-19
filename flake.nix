{
    description = "Modular multi-purpose NixOS configuration.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        # https://nixos.wiki/wiki/Impermanence
        impermanence.url = "github:nix-community/impermanence";

        simple-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver/nixos-23.05";
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, nixops, ... }@attrs: let
        system = "x86_64-linux";
        overlay-unstable = final: prev: {
            unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
            };
        };

        user = "user"; # Select user from the `./users` directory
    in {
        # Media homeserver
        nixosConfigurations.homeserver = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = attrs;
            modules = [ 
                ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
                ./users/${user}.nix
                ./systems/homeserver.nix
            ];
        };

        # dirae.org
        nixosConfigurations.dirae = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = attrs;
            modules = [
                ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
                ./users/${user}.nix
                ./systems/dirae.nix
            ];
        };

        # Debugging VM configuration
        nixosConfigurations.qemu-vm = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = attrs;
            modules = [ 
                ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
                ./users/${user}.nix
                ./systems/qemu-vm.nix
            ];
        };
    };
}

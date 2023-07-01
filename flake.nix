{
    description = "Modular multi-purpose NixOS configuration.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
        unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        # https://nixos.wiki/wiki/Impermanence
        impermanence.url = "github:nix-community/impermanence";

        simple-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver/nixos-23.05";
    };

    outputs = { self, nixpkgs, ... }@attrs: let
        user = "user"; # Select user from the `./users` directory
    in {
        # Media homeserver
        nixosConfigurations.homeserver = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = attrs;
            modules = [ 
                ./users/${user}.nix
                ./systems/homeserver.nix
            ];
        };

        # dirae.org
        nixosConfigurations.dirae = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = attrs;
            modules = [
                ./users/${user}.nix
                ./systems/dirae.nix
            ];
        };

        # Debugging VM configuration
        nixosConfigurations.qemu-vm = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = attrs;
            modules = [ 
                ./users/${user}.nix
                ./systems/qemu-vm.nix
            ];
        };
    };
}

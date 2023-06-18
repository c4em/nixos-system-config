{
    description = "Modular multi-purpose NixOS configuration.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
        unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        # https://nixos.wiki/wiki/Impermanence
        impermanence.url = "github:nix-community/impermanence";
    };

    outputs = { self, nixpkgs, ... }@attrs: let
        user = import ./username.nix;
    in {
        # Debugging VM configuration
        nixosConfigurations.qemu-vm = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [ 
                ./users/${user}.nix
                ./common.nix
                ./systems/qemu-vm.nix
                ./systems/hardware/qemu-vm.nix
            ];
        };
    };
}

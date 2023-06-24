{ impermanence, ... }:

{
    imports = [
        impermanence.nixosModules.impermanence
    ];

    environment.persistence."/nix/persist/common" = {
        directories = [
            "/etc/ssh"
            "/var/lib"
        ];

        files = [
            "/etc/machine-id"
            "/etc/shadow"
        ];
    };
}

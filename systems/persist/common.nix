{ impermanence, ... }:

{
    imports = [
        impermanence.nixosModules.impermanence
    ];

    environment.persistence."/nix/persist" = {
        directories = [
            "/etc/ssh"
            "/var/lib"
        ];

        files = [
            "/etc/machine-id"
        ];
    };
}

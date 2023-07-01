{ impermanence, ... }:

{
    imports = [
        impermanence.nixosModules.impermanence
    ];

    environment.persistence."/nix/persist" = {
        hideMounts = true;
        directories = [
            "/var/spool"
            { directory = "/var/dkim"; user = "opendkim"; 
              group = "opendkim"; mode = "u=rwx,g=rx,o=rx"; }
            { directory = "/var/sieve"; user = "virtualMail"; 
              group = "virtualMail"; mode = "u=rwx,g=rwx,o="; }
            { directory = "/var/vmail"; user = "virtualMail"; 
              group = "virtualMail"; mode = "u=rwx,g=rws,o="; }
            "/etc/dovecot"
            "/etc/pki"
            "/etc/ssh"
            { directory = "/var/lib/acme"; user = "acme"; 
              group = "acme"; mode = "u=rwx,g=rx,o=rx"; }
            { directory = "/var/lib/opendkim"; user = "opendkim"; 
              group = "opendkim"; mode = "u=rwx,g=,o="; }
            "/var/lib/postfix"
            "/var/log"
        ];
        
        files = [
            "/etc/machine-id"
        ];
    };
}

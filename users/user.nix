{  ... }:

{
    users.users.user = {
        isNormalUser = true;
        passwordFile = "/nix/config/pw"; # mkpasswd in config dir 
        description = "user";
        extraGroups = [
            "wheel"
            "audio"
            "video"
            "docker"
            "podman"
            "networkmanager"
            "kvm"
            "libvirt"
            "plugdev"
        ];
    };
}

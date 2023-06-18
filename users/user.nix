{ config, pkgs, ... }:

{
    users.users.user = {
        isNormalUser = true;
        initialPassword = "ReplaceMe";
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

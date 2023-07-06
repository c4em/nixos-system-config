{ lib, modulesPath, ... }:

{
    imports = [ 
        (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot.initrd.availableKernelModules = [ "uhci_hcd" "ahci" "virtio_pci" "virtio_blk" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.kernelParams = [ "nohibernate" ];
    boot.extraModulePackages = [ ];
    boot.zfs.devNodes = "/dev/disk/by-path";

    # Will enable this later when everything is stable
#    boot.initrd.postDeviceCommands = lib.mkAfter ''
#        zfs rollback -r local/root@blank
#    '';

    fileSystems."/" = { 
        device = "local/root";
        fsType = "zfs";
    };

    fileSystems."/boot" = { 
        device = "/dev/disk/by-uuid/B33B-0EBE";
        fsType = "vfat";
    };

    fileSystems."/nix" = {
        device = "local/nix";
        fsType = "zfs";
    };

    swapDevices = [
        { device = "/dev/disk/by-uuid/a2a0b9a3-52c9-4eb6-b03b-bcbbae0547a3"; }
    ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.ens18.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

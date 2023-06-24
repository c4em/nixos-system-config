{lib, modulesPath, ... }:

{
  imports = [ 
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r local/root@blank
  '';

  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.zfs.devNodes = "/dev/disk/by-path";

  fileSystems."/" = { 
     device = "local/root";
     fsType = "zfs";
  };

  fileSystems."/boot" = { 
      device = "/dev/disk/by-uuid/1FD8-C4B8";
      fsType = "vfat";
  };

  fileSystems."/nix" = { 
      device = "local/nix";
      fsType = "zfs";
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

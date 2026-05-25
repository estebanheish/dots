{
  config,
  lib,
  ...
}: let
  firmwarePartition = lib.recursiveUpdate {
    priority = 1;
    type = "0700"; # Microsoft basic data
    attributes = [0]; # Required Partition
    size = "1024M";
    content = {
      type = "filesystem";
      format = "vfat";
      mountOptions = [
        "noatime"
        "noauto"
        "x-systemd.automount"
        "x-systemd.idle-timeout=1min"
      ];
    };
  };

  espPartition = lib.recursiveUpdate {
    type = "EF00"; # EFI System Partition (ESP)
    attributes = [2]; # Legacy BIOS Bootable, for U-Boot to find extlinux config
    size = "1024M";
    content = {
      type = "filesystem";
      format = "vfat";
      mountOptions = [
        "noatime"
        "noauto"
        "x-systemd.automount"
        "x-systemd.idle-timeout=1min"
        "umask=0077"
      ];
    };
  };
in {
  # https://nixos.wiki/wiki/Btrfs#Scrubbing
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = ["/"];
  };

  fileSystems = {
    # mount early enough in the boot process so no logs will be lost
    "/var/log".neededForBoot = true;
  };

  disko.devices.disk.main = {
    type = "disk";
    # Pointed directly to the NVMe drive
    device = "/dev/nvme0n1";

    content = {
      type = "gpt";
      partitions = {
        FIRMWARE = firmwarePartition {
          label = "FIRMWARE";
          content.mountpoint = "/boot/firmware";
        };

        ESP = espPartition {
          label = "ESP";
          content.mountpoint = "/boot";
        };

        system = {
          type = "8305"; # Linux ARM64 root (/)
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [
              "-f" # Override existing partition
            ];
            postCreateHook = let
              thisBtrfs = config.disko.devices.disk.main.content.partitions.system.content;
              device = thisBtrfs.device;
              subvolumes = thisBtrfs.subvolumes;

              makeBlankSnapshot = btrfsMntPoint: subvol: let
                subvolAbsPath = lib.strings.normalizePath "${btrfsMntPoint}/${subvol.name}";
                dst = "${subvolAbsPath}-blank";
              in ''
                if ! btrfs subvolume show "${dst}" > /dev/null 2>&1; then
                  btrfs subvolume snapshot -r "${subvolAbsPath}" "${dst}"
                fi
              '';
            in ''
              MNTPOINT=$(mktemp -d)
              mount ${device} "$MNTPOINT" -o subvol=/
              trap 'umount $MNTPOINT; rm -rf $MNTPOINT' EXIT
              ${makeBlankSnapshot "$MNTPOINT" subvolumes."/rootfs"}
            '';
            subvolumes = {
              "/rootfs" = {
                mountpoint = "/";
                mountOptions = ["noatime"];
              };
              "/nix" = {
                mountpoint = "/nix";
                mountOptions = ["noatime"];
              };
              "/home" = {
                mountpoint = "/home";
                mountOptions = ["noatime"];
              };
              "/log" = {
                mountpoint = "/var/log";
                mountOptions = ["noatime"];
              };
              "/swap" = {
                mountpoint = "/.swapvol";
                swap."swapfile" = {
                  size = "8G";
                  priority = 3; # Higher than hibernation, lower than ZRAM
                };
              };
            };
          };
        }; # system

        swap = {
          type = "8200"; # Linux swap
          size = "9G"; # RAM + 1GB for hibernation
          content = {
            type = "swap";
            resumeDevice = true; # "hibernation" swap
            priority = 2; # Last resort swap tier
          };
        };
      };
    };
  }; # disko.devices.disk.main
}

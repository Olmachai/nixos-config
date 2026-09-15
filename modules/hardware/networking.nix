{ config, pkgs, ... }:

{
  networking = {
  wireless.iwd.enable = true;
  hostName = "nixos";
  networkmanager = {
    enable = true;
    wifi.powersave = false;
    wifi.backend = "iwd";
      };
  };
   
  hardware.enableRedistributableFirmware = true;
}

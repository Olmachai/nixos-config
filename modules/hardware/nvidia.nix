{ config, pkgs, ... }:

{
    hardware.graphics = { 
      enable = true;
      enable32Bit = true;
  };
    services.xserver.videoDrivers = [ "nvidia" "modesetting" ];

    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
      branch = "stable";
  };

    hardware.nvidia.prime = {
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
      offload.enable = true;
      offload.enableOffloadCmd = true;
  }; 
  
}

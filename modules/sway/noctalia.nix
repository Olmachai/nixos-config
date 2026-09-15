{ pkgs, config, inputs, ... }:
{

# Needed for the noctalia flake
#  imports = [
#    inputs.noctalia.nixosModules.default
#  ];

  programs.noctalia = {
    enable = true;
    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;
  };
}



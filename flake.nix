{
  description = "Olma's Modular NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    
    nirimod = {
      url = "github:srinivasr/nirimod";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        #MANDATORY IMPORTS
        ./configuration.nix 
        ./hardware-configuration.nix
        ./modules/hardware/nvidia.nix
        ./modules/hardware/networking.nix
        ./modules/pkgs.nix
        ./modules/users.nix
        
        #DE/WM IMPORTS
        #Import for Sway (Import the recommended modules below for full functionality)
        ./modules/sway/sway.nix
        #Import For Niri (Import the recommended modules below for full functionality)
        ./modules/niri/niri.nix
        #Import For OXWM (Doesn't work rn)
        #./modules/oxwm/oxwm.nix
        
        #RECOMMENDED IMPORTS
        # The noctalia module, recommended for Sway and Niri. 
        ./modules/noctalia/noctalia.nix
        #The thunar module, file manager of choice in every DE/WM on this config.
        ./modules/thunar.nix
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.olma = ./home.nix;
          }
      ];
    };
  };
}


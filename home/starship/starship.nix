{ pkgs, config, ... }: let 

  starshipPath = "${config.home.homeDirectory}/nixos-config/home/starship/starship.toml";

  in {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    #presets = [
    
    #];
  };

xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink starshipPath;

}
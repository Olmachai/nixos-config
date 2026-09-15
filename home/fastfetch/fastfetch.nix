{ pkgs, config, ... }: let
  
  fetchPath = "${config.home.homeDirectory}/nixos-config/home/fastfetch/config.jsonc";
  asciiPath = "${config.home.homeDirectory}/nixos-config/home/fastfetch/ascii";
  
  in
  {

  programs.fastfetch = {
    enable = true;
  };

  xdg.configFile."fastfetch/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink fetchPath;
  xdg.configFile."fastfetch/ascii".source = config.lib.file.mkOutOfStoreSymlink asciiPath;
}

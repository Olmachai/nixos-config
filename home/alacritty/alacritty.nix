{ pkgs, config, ... }: let
  
  alacrittyPath = "${config.home.homeDirectory}/nixos-config/home/alacritty/alacritty.toml";
  themesPath = "${config.home.homeDirectory}/nixos-config/home/alacritty/themes";
  
  in
  {

  programs.alacritty = {
    enable = true;
  };

  xdg.configFile."alacritty/alacritty.toml".source = config.lib.file.mkOutOfStoreSymlink alacrittyPath;
  xdg.configFile."alacritty/themes".source = config.lib.file.mkOutOfStoreSymlink themesPath;
}

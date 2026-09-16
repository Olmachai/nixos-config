{ config, ... }: 

# state.toml stores changes made through the ui, settings.toml is a "traditional" config file.
let 
  config = "${config.home.homeDirectory}/nixos-config/home/noctalia/settings.toml";
  state = "${config.home.homeDirectory}/nixos-config/home/noctalia/state.toml";

{
  xdg.configFile."noctalia/settings.toml".source = config.lib.file.mkOutOfStoreSymlink config;
  home.file.".local/state/noctalia/settings.toml".source = config.lib.file.mkOutOfStoreSymlink state;
}
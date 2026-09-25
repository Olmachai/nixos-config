{ config, pkgs, ... }:

{

  services.xserver = {
    enable = true;
    windowManager.oxwm.enable = true;
    xkb = {
      layout = "tr";
      variant = "";
    };
  };
  services.gnome.gnome-keyring.enable = true;
}

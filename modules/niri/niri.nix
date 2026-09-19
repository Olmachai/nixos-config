{ pkgs, inputs, config, ... }:

{
  programs.niri = {
    enable = true;
    useNautilus = false;

  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];  # uncomment if not using nautilus.  
    };
  };

  # uncomment if not using nautilus.
  xdg.mime.defaultApplications = {
    "inode/directory" = "thunar.desktop";
  };

  environment.systemPackages = with pkgs; [
    nautilus
    xwayland-satellite
    nirimod
  ];
  
  services.xserver.upscaleDefaultCursor = true;
  environment.variables = {
    XCURSOR_SIZE = "24";
  };
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.displayManager.defaultSession = "niri";
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true;
}


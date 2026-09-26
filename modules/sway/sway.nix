# import this file in configuration.nix
{ config, pkgs, ... }: {
  
    programs.sway = {
    enable = true;
    extraPackages = [];
    wrapperFeatures.gtk = true;
    extraOptions = [
      "--unsupported-gpu"
    ];
   };

  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";   
  services.gnome.gnome-keyring.enable = true; #secrets ts
  #security.polkit.enable = true; #For sway using home-manager
  security.pam.services = {
    ly.enableGnomeKeyring = true; #change according to your display manager
  };

  
  #Screensharing (needs pipewire too)
  #Tip: Make sure that you do not have conflicting definitions for xdg.portal in Home Manager.  
  #App and reigon recording doesn't work 
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    wlr = {
      enable = true;
      settings = {
        screencast = {
             chooser_type = "dmenu";
             chooser_cmd = "${pkgs.wmenu}/bin/wmenu -i -p 'Share window or monitor: '";
       };
    };
  };
    config.sway = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];    
    };
  };

  xdg.mime.defaultApplications = {
    "inode/directory" = "thunar.desktop";
  };

  security.rtkit.enable = true;

   environment.systemPackages = with pkgs; [
   wlsunset   
   slurp
   bemenu
   wmenu
 ];
  # services.displayManager.sessionPackages = [ pkgs.sway ];    
}


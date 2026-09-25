{ pkgs, config, ...}:
{
  programs.xfconf.enable = true; #saves prefrences of thunar if not on xfce.
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  services.udisks2.enable = true;
  services.devmon.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman
      thunar-vcs-plugin
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };
}
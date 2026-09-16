{ pkgs, config, ... }: {
  
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza --icons -l";
      ls = "eza --icons";
      wgdown = "sudo wg-quick down ~/.config/wg-quick/wg0.conf";
      wgup = "sudo wg-quick up ~/.config/wg-quick/wg0.conf";
      ".." = "cd ..";
      cdrebuild = 
        ''
          cd ~/nixos-config
          sudo nixos-rebuild switch --flake .
        '';
      rebuild = "sudo nixos-rebuild switch --flake .";
    };
  };

}
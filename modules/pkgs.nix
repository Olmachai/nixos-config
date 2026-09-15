{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [ 
   #zapret2 ts f'd up.
    opencode
    pciutils
    bat
    localsend
    btop
    nvtopPackages.nvidia
    prismlauncher
    vlc
    yt-dlp
    #davinci-resolve # the devs need to update the hash.
    docker
    docker-compose
    lutris
    protontricks
    protonplus
    qbittorrent
    git
    handbrake
    krita
    ffmpeg
    mpv
    openrgb-with-all-plugins
    vscodium
    discord-canary
    telegram-desktop
    webcamoid
    #vibrantlinux
    openseeface
    kdePackages.ark
    godot
    wireguard-tools
    easyeffects
    eza
    tree
    #inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    firefox
    oculante
    obs-studio
  ];

     # This expression sets necessary system options for steam to work properly.
  programs.steam = {
    enable = true;
    };
   
}
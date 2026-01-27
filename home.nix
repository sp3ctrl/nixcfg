
## HOME MANAGER 

{ config, pkgs, ... }:

{
  home.username = "sp1";
  home.homeDirectory = "/home/sp1";

  home.packages = with pkgs; [
   
    # command line tools
    neofetch
    nnn

    # general use
    qbittorrent
    vlc
    onlyoffice-desktopeditors
    strawberry
    foliate
    thunderbird
    evince
    librewolf
    google-chrome
    obsidian
        
    # themes and icons
    dracula-theme
    dracula-icon-theme
    afterglow-cursors-recolored

    # archives
    zip
    xz
    unzip
    p7zip

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusbi

    # C Development
    gcc
    gdb

  ];
  
  # GIT
  programs.git = {
    enable = true;
    userName = "sp3ctrl";
    userEmail = "126842764+sp3ctrl@users.noreply.github.com";
    
  };

  # BASH
  programs.bash = {
    enable = true;
    enableCompletion = true;

    # TODO add your custom bashrc here
    #bashrcExtra = ''
    # export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    #'';

    shellAliases = {
      nxbuild = "sudo nixos-rebuild switch";
      nxconfig = "sudo nvim ~/nixcfg/configuration.nix";
      sysup = "cd ~/nixcfg/ && sudo nix flake update && sudo nixos-rebuild switch";
     };
  };

  
  home.stateVersion = "25.11";
}

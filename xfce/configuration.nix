# Minimal XFCE + NixOS config by sp3ctrl

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = " "; # Define your hostname.
  networking.networkmanager.enable = true;
  time.timeZone = "America/Bogota";
  i18n.defaultLocale = "es_CO.UTF-8";
  services.xserver.xkb.layout = "latam";
  
  # XFCE
  services.xserver = {
     enable = true;
     desktopManager = {
       xterm.enable = false;
       xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";
  
  # Enable sound.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
     enable = true;
     pulse.enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
   };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;


  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # User account
  users.users.sp2 = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
       neovim
       fastfetch
       vlc
       onlyoffice-desktopeditors
       evince
       foliate
       librewolf
       dracula-theme
       dracula-icon-theme
       afterglow-cursors-recolored
       bibata-cursors
       zip
       unzip
       xz
       p7zip
       
     ];
   };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.systemPackages = with pkgs; [
     vim 
     wget
     git
   ];

  

  system.stateVersion = "26.05"; # Did you read the comment?

}


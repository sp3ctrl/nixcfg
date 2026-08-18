# Minimal NixosConfig by sp3ctrl

{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "sp3ctrl";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Bogota";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8" 
    "es_CO.UTF-8/UTF-8"
  ];
  services.xserver.xkb = {
    layout = "us,latam";
    variant = "";
    options = "grp:alt_space_toggle";
  };

  programs.hyprland = { 
    enable = true;
    xwayland.enable = true;   
  };
  programs.dms-shell = {
    enable = true;
    systemd = {
        enable = true;              
	restartIfChanged = true;   
    };
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    #enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting from the clipboard history (wtype)
  };
   
  services.displayManager.ly = {
    enable = true;
    x11Support = true;
    settings = {
      animation = "matrix";
      blank_box = true;
    };
  };

  # Bluetooth 
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
     
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # VIRTUALIZATION
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # USERS
  users.users.sp1 = {
    isNormalUser = true;
    description = "sp1";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      neovim
      tree
    ];
  };
  users.groups.libvirtd.members = ["sp1"];

  # SOFTWARE
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    libgcc
    bat
    kitty
    
  ];
      
  system.stateVersion = "26.05"; 
}

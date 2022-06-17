# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  # Import unstable channel.
  # sudo nix-channel --add http://nixos.org/channels/nixpkgs-unstable nixpkgs
  # sudo nix-channel --update nixpkgs
  unstable = import <nixpkgs> {};
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot = {
    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ 
      config.boot.kernelPackages.acpi_call
#      config.boot.kernelPackages.phc-intel
    ];

    tmpOnTmpfs = true;

    kernel.sysctl = { "vm.swappiness" = 1; };
  };

  networking = {
    hostName = "thinkpad"; # Define your hostname.
    #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    wireless.networks = {
      rainbow = {
        psk = "3133731337";
      };
      "free.wifi" = {};
    };
  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    vim
    unstable.neovim
    acpi
    tmux
    xkb_switch
    ranger
    fasd
    unzip
    libreoffice
    transmission
    gparted
    nox
    git
    emacs
    firefox
    gnumake
    tdesktop
    libinput-gestures
    materia-theme
    material-icons
    arc-theme
    arc-icon-theme
    lm_sensors
    tpacpi-bat
    lightlocker
    deer
    cpufrequtils
    powerstat
    ranger
    vscode
    tig
    keybase-gui
    python3
    pipenv
    mpw
    dropbox-cli
    drive
    gdrive

    (polybar.override {
      i3GapsSupport = true;
      iwSupport = true;
      alsaSupport = true;
      mpdSupport = true;
      githubSupport = true;})
    
    unstable.i3blocks-gaps

    xorg.xev
    xorg.xbacklight
    #dwarf-fortress.dwarf-fortress-full
  ];

  nixpkgs.config = {
    firefox.enableGnomeExtensions = true;
    allowUnfree = true;
  };

  fonts = {
    #enableCoreFonts = true;

    fontconfig = {
      ultimate.enable = false;
    };

    fonts = with pkgs; [
      #nerdfonts
    ];
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;

  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    cpu.intel.updateMicrocode = true;
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    bluetooth.enable = true;
  };

  powerManagement.powertop.enable = true;
  i18n.consoleUseXkbConfig = true;

  services = {

    xserver = {
      enable = true;
      videoDrivers = [ "intel" ];
      layout = "us,ru";
      xkbOptions = "caps:ctrl_modifier, grp:win_space_toggle, grp:rctrl_switch";
      libinput.enable = true;
      #services.xserver.displayManager.sddm.enable = true;
      #displayManager.gdm.enable = true;
      windowManager.i3 = { 
        enable = true;
	package = pkgs.i3-gaps;
      };
      #desktopManager.gnome3.enable = true;
    };

    fwupd.enable = true;
    keybase.enable = true;
    kbfs.enable = true;
    flatpak.enable = true;

    #gnome3.chrome-gnome-shell.enable = true;

    tlp.enable = true;
    tlp.extraConfig = ''
      #START_CHARGE_THRESH_BAT0=75
      #STOP_CHARGE_THRESH_BAT0=91
    ''; # for better battery lifetime

    acpid.enable = true;
    fstrim.enable = true;
    #services.compton.enable = true;
  };



  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.extraUsers.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  users = {
    mutableUsers = false;

    users.arthur = {
      isNormalUser = true;
      home = "/home/arthur";
      uid = 1000;
      extraGroups = [ "wheel" "networkmanager" "sway" "input" "docker" "adbusers"];
      hashedPassword = "$6$RV1CjP0jRF$z74raPoR0xtQ4aal2J5zBbIgB.MyELuMwfRG4NjRm19RGLF/7AduqrYurpKjUv5deN4Lz9mSLVDFfDlGgo3YQ/";

      packages = with pkgs; [
        steam
      ];
    };

    defaultUserShell = pkgs.zsh;
  };

  programs = {
    #ssh.startAgent = true;
    vim.defaultEditor = true;
    adb.enable = true;
    chromium.enable = true;
    mosh.enable = true;
    mtr.enable = true;
    npm.enable = true;
    tmux.enable = true;
    light.enable = true;

    #sway.enable = true;

    zsh = {
      enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        custom = "/home/arthur/.oh-my-zsh/custom/";
        plugins = [ "git" "github" ]; 
        theme = "zeit";
      };
    };
  };

  security.pam.enableSSHAgentAuth = true;

  virtualisation.docker.enable = true;

  system = {
    autoUpgrade.enable = true;
    autoUpgrade.channel = https://nixos.org/channels/nixos-unstable;
    #system.copySystemConfiguration = true;
 

    # This value determines the NixOS release with which your system is to be
    # compatible, in order to avoid breaking some software such as database
    # servers. You should change this only after NixOS release notes say you
    # should.
    stateVersion = "18.03"; # Did you read the comment?
  };
}

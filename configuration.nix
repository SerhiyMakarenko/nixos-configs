{ config, pkgs, ... }:
let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
in
{
  imports = [
    ./hardware-configuration.nix
    ./home/default.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices = [
      {
        name = "root";
        device = "/dev/disk/by-uuid/418196a6-1165-439e-aed7-ef6f6057af42";
        preLVM = true;
        allowDiscards = true;
      }
    ];

    plymouth = {
      enable = true;
      logo = pkgs.fetchurl {
        url = "https://nixos.org/logo/nixos-hires.png";
        sha256 = "1ivzgd7iz0i06y36p8m5w48fd8pjqwxhdaavc0pxs7w1g7mcy5si";
      };
    };
  };
  
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
      _8-bit-backgrounds = import ./pkgs/8-bit-backgrounds/default.nix;
      gestures = import ./pkgs/gestures/default.nix;
      libinput-gestures = import ./pkgs/libinput-gestures/default.nix;
      python3WithPkgs = import ./pkgs/python3/default.nix;
      postman = import ./pkgs/postman/default.nix;
    };
  };
  
  programs = {
    fish = {
      enable = true;
    };
  };

  environment = {
    shells = [
      "${pkgs.fish}/bin/fish"
    ];
    systemPackages = with pkgs; [
      _8-bit-backgrounds
      adapta-backgrounds
      bookworm
      fish
      fondo
      gestures
      git
      gnome3.dconf
      gnome3.dconf-editor
      gnome3.gnome-tweaks
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.mediaplayer
      gnomeExtensions.sound-output-device-chooser
      gnomeExtensions.taskwhisperer
      google-chrome
      gthumb
      home-manager
      htop
      libinput
      libinput-gestures
      lightdm_gtk_greeter
      papirus-icon-theme
      pciutils
      plymouth
      postman
      python3WithPkgs
      skypeforlinux
      slack-dark
      spotify
      sublime-merge
      tmux
      unstable._1password
      unstable.adapta-gtk-theme
      unstable.jetbrains.pycharm-community
      unstable.sublime3
      unstable.tdesktop
      vim
      wmctrl
      xdotool
    ];
    gnome3.excludePackages = [
      pkgs.gnome3.cheese
      pkgs.gnome3.epiphany
      pkgs.gnome3.geary
      pkgs.gnome3.gnome-maps
      pkgs.gnome3.gnome-music
      pkgs.gnome3.gnome-software
      pkgs.gnome3.simple-scan
    ];
  };

  fonts.fonts = with pkgs; [
    corefonts
    font-awesome
    material-design-icons
    overpass
    roboto
    roboto-mono
  ];

  networking = {
    networkmanager = {
      enable = true;
     };
    hostName = "hp-elitebook-840-5g-serhiya-makarenka";
  };

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  time.timeZone = "Europe/Kiev";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment = {
    variables.EDITOR = "vim";
    pathsToLink = [ "/libexec" ];
  };

  services = {
    openssh = {
      enable = true;
      permitRootLogin = "yes";
    };

    xserver = {
      enable = true;
      autorun = true;
      layout = "us,ua,ru";
      libinput = {
        enable = true;
        naturalScrolling = true;
        tapping = true;
      };
        
      displayManager = {
        lightdm = {
          enable = true;
          background = "${pkgs._8-bit-backgrounds}/share/backgrounds/8-bit/what-space-really-looks-like.jpg";
          greeters.gtk.enable = true;
          greeters.gtk.iconTheme.package = "${pkgs.papirus-icon-theme}";
          greeters.gtk.iconTheme.name = "Papirus-Dark";
          greeters.gtk.theme.package = "${pkgs.unstable.adapta-gtk-theme}";
          greeters.gtk.theme.name = "Adapta-Nokto-Eta";
          greeters.gtk.indicators = [ "~clock" "~spacer" "~session" "~power" ];
        };
      };
        
      desktopManager = {
        xterm = {
          enable = false;
        };
        gnome3 = {
          enable = true;
        };
        default = "none";
      };
    };
  };

  users = {
    users = {
      serhiy_makarenko = {
        isNormalUser = true;
        description = "Serhiy Makarenko";
        extraGroups = [
          "wheel"
          "input"
        ];
        shell = pkgs.fish;
      };
      root = {   
        shell = pkgs.fish;
      };
    };
  };

  security.sudo = {
    enable = true;
    # Waiting till this will be fixed https://github.com/NixOS/nixpkgs/issues/58276
    # extraRules = [
    #   { runAs = "root";
    #     users = [ "serhiy_makarenko" ];
    #     commands = [
    #       { command = "${pkgs.systemd}/bin/systemctl"; options = [ "NOPASSWD" ]; }
    #       { command = "${pkgs.systemd}/bin/poweroff"; options = [ "NOPASSWD" ]; }
    #       { command = "${pkgs.systemd}/bin/reboot"; options = [ "NOPASSWD" ]; }
    #       { command = "${pkgs.unstable.sublime3}/bin/subl"; options = [ "NOPASSWD" ]; }
    #       { command = "${config.system.build.nixos-rebuild}/bin/nixos-rebuild"; options = [ "NOPASSWD" ]; }
    #       { command = "${config.nix.package.out}/bin/nix-collect-garbage"; options = [ "NOPASSWD" ]; }
    #       { command = "${config.nix.package.out}/bin/nix-env"; options = [ "NOPASSWD" ]; }
    #     ];
    #   }
    # ];
    extraConfig = ''
      serhiy_makarenko        ALL=(root) NOPASSWD: ${pkgs.systemd}/bin/systemctl
      serhiy_makarenko        ALL=(root) NOPASSWD: ${pkgs.systemd}/bin/poweroff
      serhiy_makarenko        ALL=(root) NOPASSWD: ${pkgs.systemd}/bin/reboot
      serhiy_makarenko        ALL=(root) NOPASSWD: ${pkgs.unstable.sublime3}/bin/subl
      serhiy_makarenko        ALL=(root) NOPASSWD: ${config.system.build.nixos-rebuild}/bin/nixos-rebuild
      serhiy_makarenko        ALL=(root) NOPASSWD: ${config.nix.package.out}/bin/nix-collect-garbage
      serhiy_makarenko        ALL=(root) NOPASSWD: ${config.nix.package.out}/bin/nix-env
    '';
  };

  system.stateVersion = "19.09";
}

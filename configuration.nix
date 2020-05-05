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

    initrd.luks.devices = {
        root = {
          device = "/dev/disk/by-uuid/418196a6-1165-439e-aed7-ef6f6057af42";
          preLVM = true;
          allowDiscards = true;
        };
      };

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
      mactelnet-client = import ./pkgs/mactelnet-client/default.nix;
      organize = import ./pkgs/organize/default.nix;
      python3WithPkgs = import ./pkgs/python3/default.nix;
      postman = import ./pkgs/postman/default.nix;
    };
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  
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
      expect
      feedreader
      fish
      fondo
      gestures
      git
      gnome3.dconf
      gnome3.dconf-editor
      gnome3.gnome-tweaks
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.sound-output-device-chooser
      gnomeExtensions.taskwhisperer
      google-chrome
      gthumb
      home-manager
      htop
      jetbrains.pycharm-community
      jq
      kubectl
      kubernetes-helm
      libinput
      libinput-gestures
      lightdm_gtk_greeter
      mactelnet-client
      organize
      papirus-icon-theme
      pciutils
      plymouth
      pop-gtk-theme
      postman
      python3WithPkgs
      spotify
      sublime-merge
      tmux
      unstable._1password
      unstable.skypeforlinux
      unstable.slack-dark
      unstable.azure-cli
      unstable.sublime3
      unstable.tdesktop
      unstable.teams
      unstable.terraform
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
    firewall = {
      enable = false;
    };
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

    kubernetes = {
      easyCerts = true;
      kubelet.extraOpts = "--fail-swap-on=false";
      masterAddress = "hp-elitebook-840-5g-serhiya-makarenka";
      roles = [ "master" "node" ];
      # addons = {
      #   dashboard = {
      #     enable = true;
      #     extraArgs = [
      #       "--enable-skip-login"
      #     ];
      #   };
      # };
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
        defaultSession = "gnome";
        lightdm = {
          enable = true;
          background = "${pkgs._8-bit-backgrounds}/share/backgrounds/8-bit/what-space-really-looks-like.jpg";
          greeters.gtk.enable = true;
          greeters.gtk.iconTheme.package = "${pkgs.papirus-icon-theme}";
          greeters.gtk.iconTheme.name = "Papirus-Dark";
          greeters.gtk.theme.package = "${pkgs.pop-gtk-theme}";
          greeters.gtk.theme.name = "Pop-dark";
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

  system.stateVersion = "20.03";
}

{ config, lib, pkgs, ... }:
let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
in
{
  imports = [
    <home-manager/nix-darwin>
    ./dotfiles/default.nix
  ];

  system.defaults.finder._FXShowPosixPathInTitle = true;

  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;

  system.defaults.screencapture.location = "~/Downloads";

  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        unstable = import unstableTarball {
          config = config.nixpkgs.config;
        };
      };
    };
  };

  environment.systemPackages = with pkgs;
    [
      _1password
      aws-vault
      awscli
      htop
      tmux
      jq
    ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      fira-code
    ];
  };

  users = {
    users = {
      serhiy_makarenko = {
        name = "serhiy_makarenko";
        home = "/Users/serhiy_makarenko";
      };
    };
  };

  system.stateVersion = 4;
}
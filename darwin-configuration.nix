{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nix-darwin>
    ./dotfiles/default.nix
  ];

  system.defaults.finder._FXShowPosixPathInTitle = true;

  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;

  system.defaults.screencapture.location = "~/Downloads";

  environment.systemPackages =
    [
      pkgs.aws-vault
      pkgs.awscli
      pkgs.htop
      pkgs.tmux
      pkgs.jq
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
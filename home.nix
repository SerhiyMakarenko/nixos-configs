{ config, pkgs, ... }:

{
  imports = [
    ./scripts/default.nix
    ./dotfiles/default.nix
  ];

  programs = {
    home-manager = {
      enable = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "serhiy_makarenko";
    homeDirectory = "/home/serhiy_makarenko";

    packages = with pkgs; [
      azure-cli
      borgbackup
      kubernetes-helm
      kubectl
      sops
      htop
      tmux
      jq
    ];
  };

  fonts = {
  	fontconfig = {
  	  enable = true;
  	};
  };

  home.stateVersion = "21.05";
}

{ config, pkgs, ... }:

{
  imports = [
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
      packageOverrides = pkgs: {
        fish-foreign-env = pkgs.fishPlugins.foreign-env;
      };
    };
  };

  home = {
    username = "smakarenko";
    homeDirectory = "/home/smakarenko";

    packages = with pkgs; [
      ansible
      azure-cli
      kubernetes-helm
      kubectl
      sops
      htop
      tmux
      jq
      vagrant
    ];
  };

  fonts = {
  	fontconfig = {
  	  enable = true;
  	};
  };

  home.stateVersion = "20.09";
}

{ config, pkgs, ... }:

{
  imports = [
    ./home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "paul";
    homeDirectory = "/home/paul";

    stateVersion = "24.05"; # Please read the comment before changing.

    packages = with pkgs; [
    ];

    # Manages Dotfiles
    file = {
    };

    sessionVariables = {
      };
  };

  programs = {
    home-manager.enable = true;
    fastfetch.enable = true;
  };
}

{ config, pkgs, ... }:

{
  imports = [
    ../modules/home-manager/apps/firefox.nix
    ../modules/home-manager/apps/games.nix
    ../modules/home-manager/apps/git.nix
    ../modules/home-manager/apps/kitty.nix
    ../modules/home-manager/apps/sh.nix
  ];

  home.username = "paul";
  home.homeDirectory = "/home/paul";
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
  ];

  # Manages Dotfiles
  home.file = {
  };

  home.sessionVariables = {
  };

  # Editor
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Extra
  programs.fastfetch = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

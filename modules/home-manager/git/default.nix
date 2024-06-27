{ config, pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Paul";
      userEmail = "paul@nixos.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    lazygit = {
      enable = true;
    };
  };
}

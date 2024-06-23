{ config, pkgs, ... }:

{
  imports = [
    ../modules/home-manager/apps/games.nix
    ../modules/home-manager/apps/kitty.nix
  ];

  home.username = "paul";
  home.homeDirectory = "/home/paul";
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    #firefox

  ];

  # Manages Dotfiles
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Shell

  # Zsh
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "nix flake update";
      fupdate = "sudo nixos-rebuild switch --flake .";
      hupdate = "home-manager switch --flake .";
    };
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-autosuggestions"

        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/sudo"
      ];
    };
  };
  # Starship
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
    };
  };
  # Atuin
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  # Programming
  # Git
  programs.git = {
    enable = true;
    userName = "Paul";
    userEmail = "paul@nixos.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.gh.enable = true;
  # Lazygit
  programs.lazygit = {
    enable = true;
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

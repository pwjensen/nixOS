{ config, pkgs, ... }:

{
  home.username = "paul";
  home.homeDirectory = "/home/paul";
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

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
      ".." = "cd ..";
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

  # Gaming
  # MangoHud
  programs.mangohud = {
    enable = true;
    settings = {
      legacy_layout=0;
      horizontal = true;
      gpu_stats = true;
      cpu_stats = true;
      cpu_power = true;
      gpu_power = true;
      ram = true;
      fps = true;
      frametime=0;
      hud_no_margin = true;
      table_columns=14;
      frame_timing=1;
    };
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

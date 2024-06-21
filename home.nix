{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "paul";
  home.homeDirectory = "/home/paul";
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })


  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Programs

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

  programs.lazygit = {
    enable = true;
  };

  programs.fastfetch = {
    enable = true;
  };

  # Editor
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

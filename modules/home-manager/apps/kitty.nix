{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #kitty
  ];

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      background_opacity = "0.85";
      enable_audio_bell = false;
    };
    darwinLaunchOptions = [
      "--single-instance"
      "--directory=/tmp/my-dir"
      "--listen-on=unix:/tmp/my-socket"
    ];
  };
}

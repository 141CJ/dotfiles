{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gamescope
    awww

    firefox
    pavucontrol
    easyeffects
    vlc
    gimp
    krita
    kdePackages.kdenlive
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    streamdeck-ui

    playerctl
    hyprpicker
    xdg-utils
    desktop-file-utils
  ];

  programs.obs-studio.enable = true;
  programs.obs-studio.package = (pkgs.obs-studio.override { cudaSupport = true; });

}

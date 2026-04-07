{
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    gamescope
    rustc
    rustup
    fzf
    playerctl
    wtype
    # cliphist
    # grim
    # slurp
    # jq
    swww
    gamemode
    # hypridle
    xfce.tumbler
    nix-init
    winetricks
    nil
    nixd
    xwayland
    wayland-protocols
    alsa-lib
    nushell
    zoxide
    hyprpicker
    inputs.statcat.packages.${system}.default
    killall
    lsd
    direnv
    tmux
    gdu
    python3
    appimage-run
    xwayland-satellite
    fastfetch
    gcc
    qemu
    xdg-utils
    desktop-file-utils
    dotnetCorePackages.dotnet_8.sdk
    omnisharp-roslyn
    ntfs3g
    zip
    wine64
    winetricks
    waybar-module-music
  ];

}

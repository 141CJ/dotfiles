{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Terminal tools
    fzf
    zoxide
    killall
    lsd
    direnv
    fastfetch
    starship

    # Downloads and archives
    unzip
    zip
    wget

    # Networking
    nmap
    metasploit
    whois
    dnslookup

    # Misc
    qemu
    btop-rocm
    ffmpeg
    wine64
    winetricks
    xwayland-satellite
    pkg-config
    rocmPackages.rocm-smi
    ani-cli
  ];

}

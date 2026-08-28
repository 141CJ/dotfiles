{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust
    rustc
    rustup

    # C/C++
    gcc
    gnumake
    clang-tools

    # C#
    dotnetCorePackages.dotnet_8.sdk
    omnisharp-roslyn # C# language server

    # Misc
    nil # Nix language server
    gdb
  ];

}

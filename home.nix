{
  inputs,
  config,
  pkgs,
  ...
}:
let
  code = pkgs.vscode;

in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
    ./configs

    ./packages/gui.nix
    ./packages/misc.nix
    ./configs/stylix.nix
  ];
  home.username = "cj";
  home.homeDirectory = "/home/cj";

  xdg.desktopEntries.legcord = {
    name = "legcord";
    exec = "legcord --disable-gpu";
  };

  nix.package = pkgs.nix;

  home.stateVersion = "24.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".local/share/applications/code.desktop".source =
      let
        desktopFile = pkgs.makeDesktopItem {
          name = "Visual Studio Code";
          desktopName = "Code";
          exec = "\"${code}/bin/code\"";
          icon = "code";
          type = "Application";
          extraConfig.NoDisplay = "true";
        };
      in
      "${desktopFile}/share/applications/code.desktop";
  };
  home.sessionVariables = { };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

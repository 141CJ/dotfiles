{
  config,
  pkgs,
  inputs,
  ...
}:
{

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono";

    };

    sansSerif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono";

    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono";
    };

  };
  stylix.targets.firefox.colorTheme.enable = true;
  stylix.targets.alacritty.enable = false;
  stylix.targets.mangohud.enable = false;
  stylix.fonts.sizes.popups = 16;
  stylix.targets.helix.enable = false;
  stylix.targets.waybar.enable = false;
  stylix.targets.waybar.addCss = false;
  stylix.targets.spicetify.enable = false;

  gtk.enable = true;
}

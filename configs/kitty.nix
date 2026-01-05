{ config, pkgs, inputs, ... }: {
  programs.kitty = {
    enable = false;
    settings = {
      confirm_os_window_close = 0;
      font_size = 16.0;
      font_family = "JetBrainsMono Nerd Font";
      themeFile = "Catppuccin-Mocha";
      # tab_bar_min_tabs = 1;
      # tab_bar_edge = "top";
      # tab_bar_style = "powerline";
      # tab_powerline_style = "round";
      # tab_bar_align = "left";
      # tab_title_template =
      # "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

    };
    # keybindings = {
    # "alt+l" = "next_tab";
    # "alt+h" = "previous_tab";
    # "ctrl+t" = "new_tab";
    # };
    # extraConfig = "/home/cj/timg.sh /home/cj/Pictures/toothless/";
  };
}

{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    escapeTime = 0;
    terminal = "tmux-256color";
    extraConfig = ''
      run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux

      set -g prefix C-s

      set -g mouse on

      set -g focus-events on

      unbind-key C-l
      bind-key H select-pane -L
      bind-key J select-pane -D
      bind-key K select-pane -U
      bind-key L select-pane -R

      bind-key h previous-window
      bind-key l next-window

      bind-key -n C-h previous-window
      bind-key -n C-l next-window

      set-option -g status-position top

      set -g @catppuccin_status_modules "application cpu session uptime"
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -agF status-right "#{E:@catppuccin_status_cpu}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"

      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/tmux-cpu/cpu.tmux
        
    '';
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.cpu
    ];
  };
}

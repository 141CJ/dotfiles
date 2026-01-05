{ config, pkgs, inputs, ... }:

{
  programs.zoxide.enable = true;
  programs.zoxide.enableNushellIntegration = true;
  programs.zoxide.options = [ "--cmd cd" ];
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        $env.config.edit_mode = 'vi'
        let carapace_completer = {|spans|
        carapace $spans.0 nushell ...$spans | from json
        }
        $env.config = {
         show_banner: false,
         completions: {
         case_sensitive: false # case-sensitive completions
         quick: true    # set to false to prevent auto-selecting completions
         partial: true    # set to false to prevent partial filling of the prompt
         algorithm: "fuzzy"    # prefix or fuzzy
         external: {
         # set to false to prevent nushell looking into $env.PATH to find more suggestions
             enable: true 
         # set to lower can improve completion performance at the cost of omitting some options
             max_results: 100 
             completer: $carapace_completer # check 'carapace_completer' 
           }
         }
        keybindings: [
        {
            name: move_right_or_take_history_hint
            modifier: control
            keycode: char_f
            mode: vi_insert
            event: {
                until: [
                    { send: historyhintcomplete }
                    { send: menuright }
                    { send: right }
                ]
            }
        }]
        }

        $env.config.hooks.env_change.PWD = [ 
            { ||
                if (which direnv | is-empty) {
                    return
                }
                direnv export json | from json | default {} | load-env
            }
        ]



        $env.PATH = ($env.PATH | 
        split row (char esep) |
        prepend /home/myuser/.apps |
        append /usr/bin/env |
        append ~/.cargo/bin
        )
      '';
      settings.cursor_shape = {
        vi_insert = "blink_line";
        vi_normal = "block";

      };
      environmentVariables = {
        PROMPT_INDICATOR_VI_NORMAL = "";
        PROMPT_INDICATOR_VI_INSERT = "";
        #
        #
        #
        # 
      };
      shellAliases = {
        # cd = "z";
        cn = "cargo run";
        hmb = "home-manager switch --flake ~/.config/home-manager/#cj";

      };
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };

}

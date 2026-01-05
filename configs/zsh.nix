{ config, pkgs, inputs, ... }: {
  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" "fzf" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      ls = "lsd --long --date relative --header --blocks name,size,date";
      cd = "z";
      cn = "cargo run";
      hmb = "home-manager switch --flake ~/.config/home-manager/#cj";

    };
    # too slow
    # zplug = {
    #   enable = true;
    #   plugins = [
    #     {
    #       name = "zsh-users/zsh-autosuggestions";
    #       defer = 3;
    #     }
    #     {
    #       name = "zdharma-continuum/fast-syntax-highlighting";
    #       defer = 3;
    #     }
    #   ];
    # };
    plugins = [

      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }

    ];

    initExtra = ''
          if [[ -n "$IN_NIX_SHELL" ]]; then
        export PROMPT="%F{blue}%f $PROMPT"
      fi
            bindkey '^F' autosuggest-accept
            bindkey -v
            export KEYTIMEOUT=1  
            function zle-keymap-select {
              case $KEYMAP in
                vicmd) echo -ne '\e[2 q' ;;  # Block cursor (normal mode)
                viins|main) echo -ne '\e[6 q' ;;  # I-beam cursor (insert mode)
              esac
            }

            echo -ne '\e[6 q'  # Start with I-beam cursor in insert mode

            zle -N zle-keymap-select


            
    '';
  };
}

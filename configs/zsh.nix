{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "vi-mode"
        "fzf"
      ];
      # theme = "robbyrussell";
    };

    shellAliases = {
      ls = "lsd --long --date relative --header --blocks name,size,date";
      cd = "z";
      hmb = "home-manager switch --flake ~/.config/home-manager/#cj";

    };
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
          fastfetch

          if [[ -n "$IN_NIX_SHELL" ]]; then
        export PROMPT="%F{blue}%f $PROMPT"
      fi
            bindkey '^F' autosuggest-accept
            bindkey -v
            export KEYTIMEOUT=1  

          VI_MODE_SET_CURSOR=true

          eval "$(starship init zsh)"
    '';
  };
}

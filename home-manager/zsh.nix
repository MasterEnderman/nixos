{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;

    autosuggestion.enable = true;

    syntaxHighlighting.enable = true;

    shellAliases = let
      flakeDir = "~/nixos";
    in {
      rb = "sh ${flakeDir}/home-manager/scripts/rebuild.sh";
      upd = "pushd ${flakeDir} &>/dev/null && sudo nix flake update && popd &>/dev/null";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

      hms = "sh ${flakeDir}/home-manager/scripts/hms.sh";
      hmsf = "hms -f";

      conf = "vscodium -na ${flakeDir}";

      li = "ls -i";
    };

    history.size = 10000;
    history.path = "$HOME/.zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "starship" "sudo"];
      theme = "agnoster";
    };

    initExtra = ''clear && pfetch '';
  };
}

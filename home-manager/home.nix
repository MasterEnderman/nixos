{
  imports = [
    ./zsh.nix
    ./modules/_bundle.nix
  ];

  home = {
    username = "enderman";
    homeDirectory = "/home/enderman";
    stateVersion = "24.11";
    enableNixpkgsReleaseCheck = false;
  };
}

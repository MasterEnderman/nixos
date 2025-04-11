{pkgs, ...}: let
  additionalJDKs = with pkgs; [
    zulu8
    zulu21
  ];
in {
  programs.java = {};

  home.sessionPath = ["$HOME/.jdks"];
  home.file = builtins.listToAttrs (builtins.map (jdk: {
      name = ".jdks/${jdk.version}";
      value = {source = jdk;};
    })
    additionalJDKs);
}

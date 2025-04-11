{
  lib,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.xorg.libXcursor
      pkgs.xorg.libXrandr
      pkgs.xorg.libXxf86vm
      pkgs.libGL
    ];
  };
}

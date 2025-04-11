{pkgs, ...}: {
  chaotic.mesa-git = {
    enable = true;
    extraPackages = with pkgs; [
      mesa_git.opencl
      intel-media-driver
      intel-ocl
      vaapiIntel
    ];
  };
}

{pkgs, ...}: {
  programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.enderman = {
    isNormalUser = true;
    description = "enderman";
    extraGroups = ["networkmanager" "wheel" "input"];
    packages = with pkgs; [];
  };
}

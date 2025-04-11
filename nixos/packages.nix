{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8"];
  };

  environment.systemPackages = with pkgs; [
    # Chaotic
    proton-ge-custom
    mesa_git

    # Browser
    inputs.zen-browser.packages.${system}.default

    # Terminal
    ghostty
    alejandra # Nix Formatter
    cbonsai # Tree
    ffmpeg # File Converter
    git # Version Control
    lazygit # git GUI in CLI
    btop # Task Manager
    figlet # ASCII Banner Generator
    neofetch # Print System Stats to Console
    pfetch-rs # Similar to neofetch but smaller
    starship
    tree
    unzip
    wget
    zip

    # DS Emulator
    desmume
    melonDS

    # GBA Emulator
    mgba

    # Discord
    vesktop

    # Epic Games
    heroic

    # File Manager
    xfce.thunar

    # IntelliJ
    jetbrains.idea-community-bin

    # Note Taking
    obsidian

    # FOSS MC Launcher
    prismlauncher

    # Music
    spotify

    # Steam
    steam
    mangohud

    # Mediaplayer
    vlc

    # File Sync
    syncthing

    # Programming
    nixpkgs-fmt # Nix Formatter
    nixd # Nix Language Server
    python
    (python3.withPackages (ps: with ps; [numpy tkinter pygame beautifulsoup4]))
    go
    vscodium

    # Sound
    pipewire
    pulseaudio
    pamixer

    # Misc
    home-manager
    wine64
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}

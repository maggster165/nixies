{ lib, pkgs, inputs, config, ... }:
{
 
  home = {
    username = "maggie";
    homeDirectory = "/home/maggie";
    stateVersion = "24.11";
  };

  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    fastfetch
    ghostty
    (discord.override {withMoonlight = true;})
    rpcs3
    qadwaitadecorations
    qadwaitadecorations-qt6
    telegram-desktop
    gnome-tweaks
    gapless
    prismlauncher
    vlc
    pcsx2
    signal-desktop
    helix
    nixfmt-rfc-style
    nixd
    obsidian
    vscode-fhs
    goverlay
    mangohud
    kitty

    # THE SHAMEFUL SECTION
    hyprpicker
    hyprpaper
    # END OF SHAMEFUL SECTION
        
    hellwal


    # school crap
    libreoffice
  ];
  
    
  programs.ghostty = {
    enable = true;
    settings = {
      command = "${pkgs.fish}/bin/fish --login --interactive";
      window-padding-x = "2";
      window-padding-y = "2";
    };
  };

  programs.helix = {
    enable = true;
    settings = { editor.cursor-shape = { normal = "bar"; }; };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      eh = "sudo hx /etc/nixos/home.nix";
      ec = "sudo hx /etc/nixos/configuration.nix";
      ef = "sudo hx /etc/nixos/flake.nix";
    };
  };
  programs.nh = {
  enable = true;
  flake = "/etc/nixos/";
  };


  qt = {
    enable = true;
    style = { name = "adwaita-dark"; };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          pkgs.gnomeExtensions.appindicator.extensionUuid
        ];
      };
    }  ;
  };

}


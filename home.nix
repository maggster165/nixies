{ config, pkgs, pkgs-xs, inputs, ...}:

{
  imports = [
    inputs.moonlight.homeModules.default
  ];
  
  home.username = "maggie";
  home.homeDirectory = "/home/maggie";

  # This is how you link files from here to a config directory; quite handy
  # home.file.".config/sway/wallpaper.jpg".source = ./wallpaper.jpg;

  # this is how you link all files in a folder to a config directory
  # home.file.".config/sway/scripts" = {
  #    source = ./scripts;
  #    recursive = true;
  #    executable = true; 
  # };


  home.packages = with pkgs; [
  inputs.moonlight.packages.${pkgs.system}.discord
  ];

  


  programs.moonlight-mod = {
    enable = true;
    configs.stable = {
      extensions = {
        displaySummaries.enabled = true;
        copyAvatarUrl.enabled = true;
        imageViewer = true;
        greentext = true;
        moonbase = true;
      };
    };
  };
  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  home.stateVersion = "25.05";
}


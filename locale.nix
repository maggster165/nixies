{ config, pkgs, inputs, ... }:
{
	# Set your time zone.
  	time.timeZone = "Europe/Prague";

  	# Select internationalisation properties.
  	i18n.defaultLocale = "en_US.UTF-8";

  	i18n.extraLocaleSettings = {
    		LC_ADDRESS = "cs_CZ.UTF-8";
    		LC_IDENTIFICATION = "cs_CZ.UTF-8";
    		LC_MEASUREMENT = "cs_CZ.UTF-8";
    		LC_MONETARY = "cs_CZ.UTF-8";
    		LC_NAME = "cs_CZ.UTF-8";
    		LC_NUMERIC = "cs_CZ.UTF-8";
    		LC_PAPER = "cs_CZ.UTF-8";
    		LC_TELEPHONE = "cs_CZ.UTF-8";
    		LC_TIME = "cs_CZ.UTF-8";
  	};
  	i18n.inputMethod = {
    		enable = true;
    		type = "fcitx5";
    		fcitx5.addons = with pkgs; [fcitx5-mozc fcitx5-gtk];
    	};
}

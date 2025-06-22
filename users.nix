{config, pkgs, inputs, ...}:
{
	users.users.maggie = {
    		isNormalUser = true;
    		description = "Maggie";
    		extraGroups = [ "networkmanager" "wheel" ];
    		shell = pkgs.fish;
    		packages = with pkgs; [
    		#  thunderbird
    		prismlauncher
    		pcsx2
    		telegram-desktop
    		deltachat-desktop
    		gapless
    		video-trimmer
    		tuba
    		];
  	};
  	services.flatpak.enable = true;
  	services.flatpak.packages = [
    		"org.vinegarhq.Sober"
    		"com.usebottles.bottles"
    		"com.dec05eba.gpu_screen_recorder"
    		"be.alexandervanhee.gradia"
 	 ];
}

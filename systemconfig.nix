{ config, pkgs, pkgs-mpd, inputs, ...}:

{
	boot = {
		# pretty bootscreen
    		plymouth.enable = true;
    		plymouth.theme = "bgrt";
    		initrd.verbose = false;
    		consoleLogLevel = 3;
  	};
  	# Bootloader.
  	boot.loader.systemd-boot.enable = true;
  	boot.loader.efi.canTouchEfiVariables = true;

  	# Use latest kernel.
  	boot.kernelPackages = pkgs.linuxPackages_latest;
  	# Wireless Xbox controller support (yayyy games!!)
  	hardware.xpadneo.enable = true;
  	# i only use i2c for brightness lol
  	hardware.i2c.enable = true;
		hardware.bluetooth.enable = true; #selfexplanatory


		nixpkgs.overlays = [
			(self: super: {
				mpd = pkgs-mpd.mpd;
			})
		];
		services.mpd = {
			enable = true;
			musicDirectory = "/run/media/maggie/fedora_fedora00/@home/maggie/NewMusic/";
			user = "maggie";
			extraConfig = ''
				audio_output {
   				type "pipewire"
    			name "alsa_input.pci-0000_0a_00.6.analog-stereo"
				}
				'';
			};

		
		systemd.services.mpd.environment = {
    	XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.maggie.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
	};				

}

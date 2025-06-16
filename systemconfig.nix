{ config, pkgs, inputs, ...}:

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
}

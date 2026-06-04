{ pkgs, ... }:

{

	# Graphics adjacent as controls sleep recovery
	boot.kernelParams = [ "mem_sleep_default=deep" "nvidia-drm.modeset=1" ];
	programs.steam.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.opengl = {
		enable = true;
		driSupport32Bit = true;
	};

	hardware.nvidia = {
		powerManagement.enable = true;
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
	};

	environment.sessionVariables = {
		GBM_BACKEND = "nvidia-drm";
		__GLX_VENDOR_LIBRARY_NAME = "nvidia";
		NVD_BACKEND = "direct";
	};

	programs.steam.gamescopeSession.enable = true;
}

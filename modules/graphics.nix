{ pkgs, ... }:

{
	programs.steam.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.opengl = {
		enable = true;
		driSupport32Bit = true;
	};

	hardware.nvidia = {
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
	};

	boot.kernelParams = [ "nvidia-drm.modeset=1" ];

	environment.sessionVariables = {
		GBM_BACKEND = "nvidia-drm";
		__GLX_VENDOR_LIBRARY_NAME = "nvidia";
		NVD_BACKEND = "direct";
	};

	programs.steam.gamescopeSession.enable = true;
}

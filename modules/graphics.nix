{ pkgs, ... }:
{
  # ── Kernel parameters ────────────────────────────────────────────────────────

  boot.kernelParams = [
    # Prefer full S3 suspend (deep sleep) over S0ix (s2idle).
    # s2idle on Nvidia is unreliable for resume — deep cuts power properly.
    "mem_sleep_default=deep"

    # Enable Nvidia kernel modesetting — required for Wayland and for the
    # DRM subsystem to hand display control back to the driver on resume.
    "nvidia-drm.modeset=1"

    # Expose Nvidia as a fbdev device. Needed on some systems for TTY
    # to work at all; also helps the display pipeline reinitialise on wake.
    "nvidia-drm.fbdev=1"
  ];

  # ── Early module loading ──────────────────────────────────────────────────────

  # Load all four Nvidia kernel modules during initrd (earliest possible point).
  # Without this, on resume the DRM layer can try to reclaim the display before
  # the driver is ready, causing a permanent black screen.
  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"    # needed for CUDA / Vulkan compute
    "nvidia_drm"
  ];

  # ── Nvidia driver ─────────────────────────────────────────────────────────────

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Must be true for Wayland. Tells the driver to own the KMS/DRM node,
    # which is what lets niri (and other Wayland compositors) run on Nvidia.
    modesetting.enable = true;

    # Adds systemd hooks (nvidia-sleep.sh) that serialise GPU state to VRAM
    # before suspend and restore it on resume. This is the primary fix for
    # the black screen on wake — without it nothing saves/restores GPU state.
    powerManagement.enable = true;

    # Use the proprietary driver. The open kernel module (Turing+ only, so
    # fine for RTX 3000) is still less stable for suspend/resume as of 2024,
    # so keeping this false is the safer choice for now.
    open = false;

    # Installs nvidia-settings GUI — harmless to keep, useful for debugging
    # display and refresh-rate issues post-wake.
    nvidiaSettings = true;

    # Defaults to the latest stable driver from nixpkgs.
    # Pin explicitly if you ever hit a regression, e.g.:
    # package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # ── OpenGL / Graphics ─────────────────────────────────────────────────────────

  # nixos-unstable renamed hardware.opengl → hardware.graphics.
  # If you get "undefined option" on one of these, remove that block.
  # They are equivalent — only one will be active depending on your nixpkgs.

  hardware.graphics = {           # nixos-unstable (current name)
    enable = true;
    enable32Bit = true;           # needed for Steam / 32-bit games via Proton
  };

  # ── Wayland / Nvidia environment variables ────────────────────────────────────

  environment.sessionVariables = {
    # Tell GBM (used by Wayland compositors) to use the Nvidia DRM backend
    # rather than falling back to a software path.
    GBM_BACKEND = "nvidia-drm";

    # Force GLX to use the Nvidia vendor library instead of Mesa.
    # Without this, some apps pick Mesa's stub and get no hardware accel.
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";

    # Use the direct backend for VA-API video decode (ffmpeg, browsers, MPV).
    # Faster than the default and works correctly on Nvidia with the prop driver.
    NVD_BACKEND = "direct";

    # Tells SDL2 applications to use Wayland natively instead of XWayland.
    SDL_VIDEODRIVER = "wayland";

    # Same for Qt5/6 apps.
    QT_QPA_PLATFORM = "wayland";
  };

  # ── Steam & Gamescope ─────────────────────────────────────────────────────────

  programs.steam = {
    enable = true;

    # Runs Steam sessions inside Gamescope (Valve's micro-compositor).
    # Gives you VRR, HDR, and frame-limiter support independent of niri.
    gamescopeSession.enable = true;
  };
}

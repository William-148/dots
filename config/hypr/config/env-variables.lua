-- ####################################################################################
--  ░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀█░█▀█░█▄█░█▀▀░█▀█░▀█▀░░░█░█░█▀█░█▀▄░▀█▀░█▀█░█▀▄░█░░░█▀▀░█▀▀
--  ░█▀▀░█░█░▀▄▀░░█░░█▀▄░█░█░█░█░█░█░█▀▀░█░█░░█░░░░▀▄▀░█▀█░█▀▄░░█░░█▀█░█▀▄░█░░░█▀▀░▀▀█
--  ░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░░░░░▀░░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀░░▀▀▀░▀▀▀░▀▀▀
--  See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- ####################################################################################

-- # T O O L K I T   B A C K E N D   V A R I A B L E S
hl.env("GDK_BACKEND", "wayland,x11,*")

-- # XDG   S P E C I F I C A T I O N S
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- # Qt   V A R I A B L E S
-- hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "0")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

-- # G T K   V A R I A B L E S
-- hl.env("GDK_SCALE", "1")
-- hl.env("GTK_THEME", "WhiteSur-Dark")

-- # T H E M I N G   R E L A T E D   V A R I A B L E S
-- hl.env("XCURSOR_THEME", "Kitty")
-- hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "HyprSonic")
-- hl.env("HYPRCURSOR_SIZE", "32")

-- # N V I D I A   V A R I A B L E S
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- # C H O O S I N G   D R I   D E V I C E S
hl.env("AQ_DRM_DEVICES", "/dev/dri/card-igpu")
hl.env("__EGL_VENDOR_LIBRARY_FILENAMES", "/usr/share/glvnd/egl_vendor.d/50_mesa.json")

-- # O T H E R   V A R I A B L E S
hl.env("MOZ_ENABLE_WAYLAND", "1")

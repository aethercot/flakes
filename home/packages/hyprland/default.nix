{ theme, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    $mod = SUPER

    animations {
      enabled = true

      # Thank you hyper-dot (https://github.com/hyper-dot/Arch-Hyprland)
      bezier = overshot, 0.005, 0.9, 0.1, 1.05
      bezier = smoothOut, 0.36, 0, 0.66, -0.56
      bezier = smoothIn, 0.25, 1, 0.5, 1

      animation = windows, 1, 3, overshot, slide
      animation = windowsOut, 1, 3, smoothOut, slide
      animation = windowsMove, 1, 3, smoothOut, slide
      animation = border, 1, 3, default
      animation = fade, 1, 3, smoothIn
      animation = fadeDim, 1, 3, smoothIn
      animation = workspaces, 1, 3, default
    }

    decoration {
      rounding = 8
    }

    general {
    	col.active_border = 0xff${theme.colors.activeBorderColor}
    }

    bind = $mod SHIFT, E, exec, pkill Hyprland
    bind = $mod, Q, killactive,

    bind = $mod, Return, exec, alacritty
    bind = $mod, B, exec, BROWSER

    # Move focus
    bind = $mod, left, movefocus, l
    bind = $mod, down, movefocus, d
    bind = $mod, up, movefocus, u
    bind = $mod, right, movefocus, r

    # Move active
    bind = $mod SHIFT, left, movewindow, l
    bind = $mod SHIFT, down, movewindow, d
    bind = $mod SHIFT, up, movewindow, u
    bind = $mod SHIFT, right, movewindow, r

    # Move focus to workspace
    bind = $mod CTRL, left, workspace, e-1
    bind = $mod CTRL, right, workspace, e+1

  '';

  wayland.windowManager.hyprland.enable = true;
}

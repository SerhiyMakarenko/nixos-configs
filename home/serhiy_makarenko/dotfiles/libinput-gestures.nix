{ homedir, }:

{
  text = ''
    [Desktop Entry]
    Type=Application
    Terminal=false
    Name=Libinput Gestures
    Exec=/run/current-system/sw/bin/libinput-gestures
    Icon=libinput-gestures
    Comment=Background application to intercept and action libinput gestures from touchpad.
    Categories=GNOME;GTK;System;
  '';
  target = ".config/autostart/libinput-gestures.desktop";
}
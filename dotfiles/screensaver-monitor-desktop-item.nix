{
  text = ''
    [Desktop Entry]
    Type=Application
    Exec=~/.bin/screensaver-monitor.sh
    Hidden=false
    NoDisplay=false
    X-GNOME-Autostart-enabled=true
    Name[en_US]=Screensaver Monitor
    Name=Screensaver Monitor
    Comment[en_US]=
    Comment=
  '';
  target = ".config/autostart/screensaver-monitor.desktop";
  executable = true;
}
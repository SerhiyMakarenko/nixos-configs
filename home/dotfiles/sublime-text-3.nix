{ homedir, username, }:

{
  text = let
    draculaPath = ".config/sublime-text-3/Installed Packages/Dracula Color Scheme.sublime-package";
    in builtins.toJSON ({
      color_scheme = if builtins.pathExists (builtins.concatStringsSep "/" ["${homedir}" draculaPath]) then "Packages/Dracula\ Color\ Scheme/Dracula.tmTheme" else "Monokai.sublime-color-scheme";
      ignored_packages = [ "Vintage" ];
      font_size = 12;
      sublime_merge_path = /run/current-system/sw/bin/smerge;
    });
  target = ".config/sublime-text-3/Packages/User/Preferences.sublime-settings";
}

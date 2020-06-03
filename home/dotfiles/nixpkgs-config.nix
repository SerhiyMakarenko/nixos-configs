{ homedir, username, }:

{
  text = ''
    {
      allowUnfree = true;
    }
    '';
  target = ".config/nixpkgs/config.nix";
}

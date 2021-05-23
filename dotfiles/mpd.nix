{
  text = ''
    music_directory "/run/user/1000/gvfs/smb-share:server=srv2.makarenko.home,share=ncase\%20m1\%20file\%20share/Serhiy\'s\ Files/DSD/"
    playlist_directory "/home/smakarenko/.local/share/cantata/mpd/playlists"
    sticker_file "/home/smakarenko/.local/share/cantata/mpd/sticker.sql"
    bind_to_address "/home/smakarenko/.local/share/cantata/mpd/socket"
    db_file "/home/smakarenko/.cache/cantata/mpd/tag_cache"
    pid_file "/home/smakarenko/.cache/cantata/mpd/pid"
    state_file "/home/smakarenko/.cache/cantata/mpd/state"
    log_file "/dev/null"
    zeroconf_enabled "no"
    metadata_to_use "artist,album,title,track,name,genre,date,disc,albumartist,composer,musicbrainz_albumid,originaldate,albumartistsort,artistsort,albumsort"
    audio_output {
      type           "alsa"
      name           "FiiO K3"
      device         "front:CARD=K3,DEV=0"
      auto_resample  "no"
      auto_channels  "no"
      auto_format    "no"
      dop            "yes"
    }
    mixer_type "software"
    audio_buffer_size "8192"
    filesystem_charset "UTF-8"
    id3v1_encoding "UTF-8"
  '';
  target = ".local/share/cantata/mpd/mpd.conf";
}

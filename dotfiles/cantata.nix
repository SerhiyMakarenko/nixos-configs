{
  text = ''
    [General]
    cdAuto=true
    cddbHost=freedb.freedb.org
    cddbPort=8880
    composerGenres=@Invalid()
    contextAlwaysCollapsed=false
    contextAutoScroll=false
    contextBackdrop=0
    contextBackdropBlur=0
    contextBackdropFile=
    contextBackdropOpacity=15
    contextDarkBackground=false
    contextSplitterState=@ByteArray(\0\0\0\xff\0\0\0\x1\0\0\0\x3\0\0\x1\x4\0\0\x1\x4\0\0\x1\x4\x1\0\0\0\0\x1\0\0\0\x1\0)
    contextSwitchTime=0
    contextTrackView=0
    coverFilename=
    cueSupport=parse
    currentConnection=-
    fetchCovers=true
    forceSingleClick=true
    hiddenPages=PlayQueuePage, ContextPage
    hiddenStreamCategories=@Invalid()
    ignorePrefixes=The
    infoTooltips=true
    inhibitSuspend=false
    lang=
    lyricProviders=lyrics.wikia.com, lyricsreg.com, lyricsmania.com, azlyrics.com, songlyrics.com, elyrics.net, lyricsdownload.com, lyrics.com, directlyrics.com, loudson.gs, teksty.org
    mainWindowSize=@Size(950 684)
    maximized=false
    minimiseOnClose=true
    mpris=true
    page=LibraryPage
    paranoiaFull=true
    paranoiaNeverSkip=true
    paranoiaOffset=0
    playQueueAutoExpand=true
    playQueueBackground=0
    playQueueBackgroundBlur=0
    playQueueBackgroundFile=
    playQueueBackgroundOpacity=15
    playQueueConfirmClear=false
    playQueueScroll=true
    playQueueSearch=true
    playQueueStartClosed=false
    playQueueView=grouped
    playStream=false
    responsiveSidebar=true
    showCoverWidget=true
    showDeleteAction=false
    showFullScreen=false
    showPlaylist=true
    showPopups=false
    showRatingWidget=false
    showStopButton=false
    showTechnicalInfo=false
    showTimeRemaining=false
    sidebar=17
    singleTracksFolders=@Invalid()
    splitterAutoHide=false
    splitterState=@ByteArray(\0\0\0\xff\0\0\0\x1\0\0\0\x2\0\0\x1|\0\0\x2:\x1\0\0\0\x1\x1\0\0\0\x1\0)
    startHidden=false
    startupState=prev
    stopFadeDuration=400
    stopOnExit=true
    storeCoversInMpdDir=false
    style=
    useCddb=true
    useOriginalYear=false
    useSystemTray=false
    version=2.4.1
    volumeStep=5
    wikipediaIntroOnly=true

    [AlbumView]
    fullWidthCover=false

    [Connection--]
    allowLocalStreaming=true
    applyReplayGain=true
    autoUpdate=false
    dir="/run/user/1000/gvfs/smb-share:server=srv2.makarenko.home,share=ncase%20m1%20file%20share/Serhiy's Files/DSD"
    host=/home/smakarenko/.local/share/cantata/mpd/socket
    passwd=
    port=6600
    replayGain=off
    streamUrl=

    [DevicesPage]
    gridZoom=100
    searchActive=false
    viewMode=simpletree

    [DynamicPlaylistsPage]
    gridZoom=100
    searchActive=false
    viewMode=list

    [FolderPage]
    currentPage=

    [HttpStream]
    volume=50

    [LibraryPage]
    albumSort=album
    artist\gridZoom=100
    artist\searchActive=false
    artist\viewMode=detailedtree
    artistImages=false
    grouping=artist
    librarySort=year

    [MpdBrowsePage]
    gridZoom=100
    searchActive=false
    viewMode=detailedtree

    [OnlineServicesPage]
    currentPage=

    [PlayQueuePage]
    searchActive=false

    [PlaylistsPage]
    currentPage=

    [PodcastWidget]
    gridZoom=100
    searchActive=false
    viewMode=detailedtree

    [PreferencesDialog]
    size=@Size(896 709)

    [Proxy]
    hostname=
    mode=0
    password=
    port=8080
    type=3
    username=

    [SearchPage]
    gridZoom=100
    searchActive=false
    searchCategory=artist
    viewMode=list

    [SmartPlaylistsPage]
    gridZoom=100
    searchActive=false
    viewMode=list

    [StoredPlaylistsPage]
    gridZoom=100
    searchActive=false
    startClosed=true
    viewMode=detailedtree

    [StreamsBrowsePage]
    gridZoom=100
    searchActive=false
    viewMode=detailedtree

    [VolumeControl]
    control=mpd

    [jamendo]
    albumSort=album
    gridZoom=100
    grouping=genre
    librarySort=year
    searchActive=false
    viewMode=detailedtree

    [localbrowsehome]
    gridZoom=100
    searchActive=false
    viewMode=simpletree

    [localbrowseroot]
    gridZoom=100
    searchActive=false
    viewMode=simpletree

    [magnatune]
    albumSort=album
    gridZoom=100
    grouping=genre
    librarySort=year
    searchActive=false
    viewMode=detailedtree
  '';
  target = ".config/cantata/cantata.conf";
}
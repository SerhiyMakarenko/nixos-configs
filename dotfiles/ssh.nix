{
  enable = true;
  matchBlocks = {
    "srv1.makarenko.home" = {
      hostname = "srv1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "srv2.makarenko.home" = {
      hostname = "srv2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "srv3.makarenko.home" = {
      hostname = "srv3.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "srv4.makarenko.home" = {
      hostname = "srv4.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "srv5.makarenko.home" = {
      hostname = "srv5.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "rpi1.makarenko.home" = {
      hostname = "rpi1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "rpi2.makarenko.home" = {
      hostname = "rpi2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "rpi3.makarenko.home" = {
      hostname = "rpi3.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "gw1.makarenko.home" = {
      hostname = "gw1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "gw2.makarenko.home" = {
      hostname = "gw2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "sw1.makarenko.home" = {
      hostname = "sw1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "sw2.makarenko.home" = {
      hostname = "sw2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "cap1.makarenko.home" = {
      hostname = "cap1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "cap2.makarenko.home" = {
      hostname = "cap2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "cap3.makarenko.home" = {
      hostname = "cap3.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "macbook-pro-serhiya-makarenka.makarenko.home" = {
      hostname = "macbook-pro-serhiya-makarenka.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
      identitiesOnly = true;
    };
    "github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/rsa/SM.Github.rsa";
      identitiesOnly = true;
    };
    "gitlab.com" = {
      hostname = "gitlab.com";
      user = "git";
      identityFile = "~/.ssh/rsa/SM.Gitlab.rsa";
      identitiesOnly = true;
    };
    "gitlab.makarenko.home" = {
      hostname = "gitlab.makarenko.home";
      user = "git";
      identityFile = "~/.ssh/rsa/SM.Gitlab.rsa";
      identitiesOnly = true;
    };
    "ssh.dev.azure.com" = {
      hostname = "ssh.dev.azure.com";
      user = "git";
      identityFile = "~/.ssh/rsa/SM.Azure.rsa";
      identitiesOnly = true;
    };
    "windows-guest.virtualbox.local" = {
      hostname = "127.0.0.1";
      user = "serhiy_makarenko";
      port = 2233;
      identityFile = "~/.ssh/rsa/SM.Azure.rsa";
      identitiesOnly = true;
    };
    "sk-hynix.k8s.server" = {
      hostname = "218.55.253.99";
      user = "smakarenko";
      port = 7866;
      identityFile = "~/.ssh/rsa/SM.Azure.rsa";
      localForwards = [
        {
          bind.port = 63473;
          host.address = "192.168.220.1";
          host.port = 80;
        }
      ];
      dynamicForwards = [
        {
          port = 44444;
        }
      ];
      identitiesOnly = true;
  	};
  	"sk-hynix.nas.server" = {
        hostname = "218.55.253.99";
        user = "smakarenko";
        port = 7867;
        identityFile = "~/.ssh/rsa/SM.Azure.rsa";
        identitiesOnly = true;
  	};
  };
}
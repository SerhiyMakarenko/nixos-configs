{
  enable = true;
  matchBlocks = {
    "srv1.makarenko.home" = {
      hostname = "srv1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "srv2.makarenko.home" = {
      hostname = "srv2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "srv3.makarenko.home" = {
      hostname = "srv3.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "srv4.makarenko.home" = {
      hostname = "srv4.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "srv5.makarenko.home" = {
      hostname = "srv5.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "rpi1.makarenko.home" = {
      hostname = "rpi1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "rpi2.makarenko.home" = {
      hostname = "rpi2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "rpi3.makarenko.home" = {
      hostname = "rpi3.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "gw1.makarenko.home" = {
      hostname = "gw1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "gw2.makarenko.home" = {
      hostname = "gw2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "sw1.makarenko.home" = {
      hostname = "sw1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "sw2.makarenko.home" = {
      hostname = "sw2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "cap1.makarenko.home" = {
      hostname = "cap1.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "cap2.makarenko.home" = {
      hostname = "cap2.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "cap3.makarenko.home" = {
      hostname = "cap3.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "macbook-pro-serhiya-makarenka.makarenko.home" = {
      hostname = "macbook-pro-serhiya-makarenka.makarenko.home";
      user = "serhiy_makarenko";
      identityFile = "~/.ssh/rsa/SM.Home.rsa";
    };
    "github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/rsa/SM.Github.rsa";
    };
    "gitlab.com" = {
      hostname = "gitlab.com";
      user = "git";
      identityFile = "~/.ssh/rsa/SM.Gitlab.rsa";
    };
    "gitlab.makarenko.home" = {
      hostname = "gitlab.makarenko.home";
      user = "git";
      identityFile = "~/.ssh/rsa/SM.Gitlab.rsa";
    };
    "ssh.dev.azure.com" = {
      hostname = "ssh.dev.azure.com";
      user = "git";
      identityFile = "~/.ssh/rsa/SM.Azure.rsa";
    };
    "windows-guest.virtualbox.local" = {
      hostname = "127.0.0.1";
      user = "serhiy_makarenko";
      port = 2233;
      identityFile = "~/.ssh/rsa/SM.Azure.rsa";
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
	};
	"sk-hynix.nas.server" = {
      hostname = "218.55.253.99";
      user = "smakarenko";
      port = 7867;
      identityFile = "~/.ssh/rsa/SM.Azure.rsa";
	};
  };
}

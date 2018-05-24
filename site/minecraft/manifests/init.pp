
class minecraft {
  file {'/opt/minecraft':
    ensure  =>  directory,
  }
  
  file {'/opt/minecraft/eula.txt':
    ensure  =>  file,
    content =>  'eula=true',
  }
  
  file {'/opt/minecraft/server.jar':
    ensure  => file,
    source  => 'puppet:///modules/minecraft/server.jar',
    before => Service['minecraft'],
  }
  
  package {'default-jre':
    ensure  =>  present,
  }
  
  file {'/etc/systemd/system/minecraft.service':
    ensure  =>  file,
    source  =>  'puppet:///modules/minecraft/minecraft.service',
    # content => "[Unit]\nDescription=Minecraft Server\nWants=network.target\nAfter=network-online.target\nRequires=network-online.target\n\n[Service]\nWorkingDirectory=/opt/minecraft\nExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\nRestart=always\n\n[Install]\nWantedBy=multi-user.target\n",

  }
  
  service {'minecraft':
    ensure  =>  running,
    enable  =>  true,
  }
}

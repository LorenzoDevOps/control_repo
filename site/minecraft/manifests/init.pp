class minecraft {
  file {'/opt/minecraft':
    ensure  =>  directory,
  }
  
  file {'/opt/minecraft/eula.txt':
    ensure  =>  file,
    content =>  'eula=true',
  }
  
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    content => "[Unit]\nDescription=Minecraft Server\nWants=network.target\nAfter=network-online.target\nRequires=network-online.target\n\n[Service]\nWorkingDirectory=/opt/minecraft\nExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\nRestart=always\n\n[Install]\nWantedBy=multi-user.target\n",
    owner  => 'root',
    group  => 'root',
    mode    => '0644',
  }
  
  package {'default-jre':
    ensure  =>  present,
  }
  
  service {'minecraft':
    ensure  =>  running,
    enable  =>  true,
  }
}

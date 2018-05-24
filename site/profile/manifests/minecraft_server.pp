
class profile::minecraft_server {
  include ::wget
  
  file { '/opt/minecraft':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode    => '0644',
  }
  
  file { '/etc/systemd/system/minecraft.service':
      ensure => file,
      content => "[Unit]\nDescription=Minecraft Server\nWants=network.target\nAfter=network-online.target\nRequires=network-online.target\n\n[Service]\nWorkingDirectory=/opt/minecraft\nExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\nRestart=always\n\n[Install]\nWantedBy=multi-user.target\n",
      owner  => 'root',
      group  => 'root',
      mode    => '0644',
  }

  wget::fetch { 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar':
    destination => '/opt/minecraft/',
    timeout     => 15,
    verbose     => true,
  }

}

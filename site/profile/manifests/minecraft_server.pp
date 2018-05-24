
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
      content => "[Unit]\n
Description=Minecraft Server\n
Wants=network.target\n
After=network-online.target\n
Requires=network-online.target\n
\n
[Service]\n
WorkingDirectory=/opt/minecraft\n
ExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\n
Restart=always\n
\n
[Install]\n
WantedBy=multi-user.target\n",
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

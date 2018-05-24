
class profile::minecraft_server {
  user { 'admin':
   ensure => present,
  }

  file { '/root/README':
   ensure  => present,
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
WantedBy=multi-user.target",\n
  }

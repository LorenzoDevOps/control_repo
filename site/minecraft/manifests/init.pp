
class minecraft (
 $url = 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar',
 $install_dir = '/opt/minecraft'){
  file {'/opt/minecraft':
    ensure  =>  directory,
  }
  
  file {"${install_dir}/eula.txt":
    ensure  =>  file,
    content =>  'eula=true',
  }
  
  wget ::fetch {"${install_dir}/server.jar":
    ensure  => file,
    source  => $url,
    destination  => "${install_dir}",
  }
  
  #file {'/opt/minecraft/server.jar':
  #  ensure  => file,
  #  source  => 'puppet:///modules/minecraft/server.jar',
  #  before => Service['minecraft'],
  #}
  
  package {'default-jre':
    ensure  =>  present,
  }
  
  file {'/etc/systemd/system/minecraft.service':
    ensure  =>  file,
    source  =>  'puppet:///modules/minecraft/minecraft.service',
  }
  
  service {'minecraft':
    ensure  =>  running,
    enable  =>  true,
    require => [
      Package['default-jre'],
      File["${install_dir}/eula.txt"],
      File['/etc/systemd/system/minecraft.service'],
      File["${install_dir}/server.jar"]
      ],
  }
}

class minecraft {
  file {'/opt/minecraft':
    ensure  =>  directory,
  }
  
  file {'/opt/minecraft/eula.txt':
    ensure  =>  file,
    content =>  'eula=true',
  }
  
  package {'default-jre':
    ensure  =>  present,
  }
  
  service {'minecraft':
    ensure  =>  running,
    enable  =>  true,
  }
}

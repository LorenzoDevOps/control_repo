class profile::base {
  user { 'admin':
    ensure => present,
  }

  file { '/root/README':
    ensure  => present,
    content => "Ceci est un README\nMon adresse ip est ${ipaddress}\n",
  }
  
   host { 'client': 
    ip => '10.134.39.246',
    host_aliases => 'node2',
  }
}

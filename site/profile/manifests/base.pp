class profile::base {
  user { 'admin':
    ensure => present,
  }

  file { '/root/README':
    ensure  => present,
    content => "Ceci est un README\nMon adresse ip est ${ipaddress}\n",
  }
  
   host { '/etc/hosts': 
    ensure       => present,
    comment      => 'TEST ADDING HOSTS'
    ip => '10.134.39.246',
    host_aliases => 'node2',
    #target       => '/etc/hosts'
  }
}

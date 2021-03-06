class profile::base {
  user { 'admin':
   ensure => present,
  }

  file { '/root/README':
   ensure  => present,
   content => "Ceci est un README\nMon adresse ip est ${ipaddress}\n",
  }
  
   host { 'puppet-client-1': 
    ensure       => present,
    comment      => 'Host added by Puppet',
    ip           => '10.94.69.13',
    host_aliases => ['node1','client1'],    
  }
  
   host { 'puppet-client-2': 
    ensure       => present,
    comment      => 'Host added by Puppet',
    ip           => '10.94.69.14',
    host_aliases => ['node2','client2'],    
  }
}

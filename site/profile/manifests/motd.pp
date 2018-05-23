class profile::motd {
  file { '/etc/motd':
    ensure  => file,
    mode    => '1204',
    content => "Bienvenu sur ${::hostname} - ${::fqdn} - ${::operatingsystem} ${::operatingsystemrelease}\nCe noeuds est sous le contrôle de Puppet ${::puppetversion}\n";
  }
} 

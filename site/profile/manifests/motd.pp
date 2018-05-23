class profile::motd {
  file { '/etc/motd':
    ensure  => file,
    mode    => '1204',
    content => "Bienvenue sur ${::hostname} - ${::fqdn} - ${::operatingsystem} ${::operatingsystemrelease}\nCe noeud est sous le contrôle de Puppet ${::puppetversion}\n";
  }
} 

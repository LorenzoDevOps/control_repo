class profile::motd {
  file { '/etc/motd':
    ensure  => file,
    mode    => '644',
    content => "Welcome to ${::hostname} - ${::fqdn} - ${::operatingsystem} ${::operatingsystemrelease} This node is under the control of Puppet ${::puppetversion} Have a lot of fun...enjoy the fish";
  }
} 

class profile::ssh_server {
  package { 'openssh-server':
    ensure  => present,
  }
  
  service { 'sshd':
    ensure  => 'running',
    enable  => 'true',
  }
  file { "/home/root/.ssh/id_rsa.pub":
    ensure => present,
    source => "puppet:///modules/user-sshkey/root/id_rsa.pub",
    owner   => root,
    group   => root,
    mode    => 0644,
  }
}

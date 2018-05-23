class profile::ssh_server {
  package { 'openssh-server':
    ensure  => present,
  }
  
  service { 'sshd':
    ensure  => 'running',
    enable  => 'true',
  }
  file { "/home/$user/.ssh/id_$type.pub":
    ensure => present,
    source => "puppet:///modules/user-sshkey/$user/id_rsa.pub",
    owner   => $user,
    group   => $user,
    mode    => 0644,
  }
}

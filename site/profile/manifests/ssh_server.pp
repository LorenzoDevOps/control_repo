class profile::ssh_server {
  package { 'openssh-server':
    ensure  => present,
  }
  
  service { 'sshd':
    ensure  => 'running',
    enable  => 'true',
  }

  sshkeys::set_authorized_key { 'root@puppet to root@puppet-client-1':
  local_user  => 'root',
  remote_user => 'root@puppet-client-1',
  home        => '/root',
  }
}

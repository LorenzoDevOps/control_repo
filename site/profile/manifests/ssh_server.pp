class profile::ssh_server {
  package { 'openssh-server':
    ensure  => present,
  }
  
  service { 'sshd':
    ensure  => 'running',
    enable  => 'true',
  }

  ssh_authorized_key { 'root@pc-lorenzo.localdomain':
    ensure  =>  present,
    user    =>  'root',
    purge   =>  true,
    type    =>  'ssh-rsa',
    key     =>  'AAAAB3NzaC1yc2EAAAADAQABAAABAQDzUD6+KEm7EupB18qTcI/H1ARMRlzb9HCVQF/cRFbR5RdsEOJUjBYM4psOz09S9b+MHREEa1bF5BI1WaAFZlOlaGzb8ievaWOzynbqol3EYSPmM7s5SyKDzlja4vwd654IQfr7lR2QwkcvkwlsdPopbxwgKPUcCgnNvusjV++nUdnJJHv/bCbKPBgWPdIXlwRLGPYANr2debdZieFMZi46SiZV1mZ0BTaFwh4HTNe0/pjvfR0lbr20AeVjwSSrT3S0usfINm959ltn9WZBDQS0Ai3Hgl7amViT6T+a3A8xe4WEqI2Z8drPyPPtJR7j2Bj0ru+3xKQB1JlBY5soK4CJ',
  }
}

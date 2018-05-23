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
    type    =>  'ssh-rsa',
    key     =>  'AAAAB3NzaC1yc2EAAAADAQABAAABAQDF4kJF/Ecd4PoEAb8KeO7kZGMixeHZIWZAGwFiSc0O7+6Fj4Jc7Bq+WMqb4+dfJJQ4E1Kf28at+eUs24VSXedYoD4ewrjSnyLNJtmQT4C63GvoYU4jElWpRxgd1F39sFsKih+960GYlgN53K6YC34s6R6FBPWhuZrPLyq+JJ/8kmT4QC3CEtIMdxm+ndwy4fhwjUT7Xz2Wi6w2lf6siXw1/SY7G5AXuWlRJwwc0A8Mna9haCg07gdhiQCjIh6Mb4xwtLwZ3WOjO8uRXtevjZ3HI7FQ1o08MqE9ds+esDHJdLWR52/DzBJmtgr4rTVW0dWiqMJ0Z+eYbRSDBS5Du3ar',
  }
}

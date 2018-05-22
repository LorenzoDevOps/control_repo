node default {
   user { 'admin':
    ensure => present,
}

 file { '/root/README':
ensure  => file,
}
}

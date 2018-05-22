node default {
  user { 'bibi':
    ensure  => present,
  }
}

node 'puppet' {
  include role::master_server
}

node /^puppet-client-/ {
  include role::client_role
}

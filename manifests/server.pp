class couch {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

  package { "couchdb":
    ensure => present,
  }

  service { "couchdb":
    ensure => running,
    require => Package["couchdb"],
  }
}

include couch 

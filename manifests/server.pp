class couch {
  package { "couchdb":
    ensure => present,
  }

  service { "couchdb":
    ensure => running,
    require => Package["couchdb"],
  }
}

include couch 

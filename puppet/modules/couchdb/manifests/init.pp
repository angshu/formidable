class couchdb {

  package { "couchdb":
    ensure => present,
  }

  file { "local.ini" :
      path => "/etc/couchdb/local.ini",
      ensure => file,
      owner => couchdb,
      group => couchdb,
      mode => 664,
      content => template("couchdb/local.ini.erb"),
  }

  service { "couchdb":
    require => Package["couchdb"],
    ensure => running,
    subscribe => File["local.ini"],
  }

  package { "curl":
    ensure => present,
  }

  exec { "create-events-db":
    require => [Service["couchdb"],
                Package["curl"]],
    command => "/usr/bin/curl -X PUT http://admin:password@localhost:5984/events",
    refreshonly => true,
  }
}

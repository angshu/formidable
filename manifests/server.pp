class couchdb {

  exec { 'install puppet user':
    command => '/bin/echo "id -u puppet &>/dev/null || useradd puppet" | /bin/sh'
  }

  package { "couchdb":
    ensure => present,
  }

  service { "couchdb":
    ensure => running,
    enable => true,
    require => Package["couchdb"],
  }
}

include couchdb 

class couchdb {
  package { "couchdb":
    ensure => present,
  }

  file { "local.ini" :
      path => "/etc/couchdb/local.ini",
      ensure => file,
      content => "[httpd]
port = 5984
bind_address = 0.0.0.0",
  }

  service { "couchdb":
    require => Package["couchdb"],
    ensure => running,
    subscribe => File["local.ini"],
  }
}

class pip {
  package { "python-dev":
    ensure => installed,
  }

  package { "python-pip":
    ensure => installed,
  }
}

class couchapp-tool {
  exec { "install-couchapp-tool":
    command => "/usr/bin/pip install couchapp",
  }
}

class couchapp {
  exec { "install-couchapp":
    cwd => "/vagrant/couchapp",
    command => "/usr/local/bin/couchapp push formidable",
  }
}

include couchdb 
include pip
#include couchapp-tool
#include couchapp

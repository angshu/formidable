class couchdb {
  package { "couchdb":
    ensure => present,
  }

  service { "couchdb":
    require => Package["couchdb"],
    ensure => running,
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
include couchapp-tool
include couchapp

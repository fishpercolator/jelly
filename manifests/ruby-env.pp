class ruby-env {

  # fixme - not working correctly
  exec {'apt_update':
    command => '/usr/bin/apt-get update',
    refreshonly => true;
  }

  package {["build-essential", "ruby1.9.1-full", "libpq-dev"]:
    ensure => installed,
    provider => apt,
    require => Exec['apt_update'];
  }

  bundler::install {"/vagrant":
    require => Package["build-essential", "ruby1.9.1-full", "libpq-dev"];
  }
}

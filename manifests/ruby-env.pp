class ruby-env {

  package {["build-essential", "ruby1.9.1-full", "libpq-dev"]:
    ensure => installed,
    provider => apt;
  }

  bundler::install {"/vagrant":
    require => Package["build-essential", "ruby1.9.1-full", "libpq-dev"];
  }
}

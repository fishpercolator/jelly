class database {
  include postgresql::server

  postgresql::db { 'jelly':
    user     => 'jelly',
    password => 'j3llyb4by'
  }

  exec {"rake db:migrate":
    path    => '/usr/bin:/usr/local/bin',
    cwd     => '/vagrant',
    user    => 'vagrant',
    require => [Class['ruby-env'], Postgresql::Db['jelly']];
  }
}

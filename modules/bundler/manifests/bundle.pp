define bundler::bundle (
    $source,
    $gems
){
  include bundler

  file { $name:
    content => template('bundler/Gemfile'),
    notify  => Exec["bundle_${name}"]
  }

  exec { "bundle_${name}":
    path        => "${ruby::params::gem_binpath}",
    command     => "bundle install",
    cwd         => dirname("${name}"),
    refreshonly => true,
  }

}

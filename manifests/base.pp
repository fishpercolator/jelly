class {"apt": always_apt_update => true; }
class {"ruby-env": require => Class["apt"]; }
class {"database": }


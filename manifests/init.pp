class maven {

  $maven_home = hiera('maven_home')

  $maven_rpm_ver = '3.3.3'
  
  $packages = [
    "maven-${maven_rpm_ver}",
  ]

  package { $packages:
    ensure => installed,
  }


  file { '/etc/profile.d/maven.sh':
    ensure  => present,
    content => template('maven/maven.sh'),
  }

  file { '/usr/java/maven-3.0':
    ensure  => link,
    target  => "/usr/java/maven-${maven_rpm_ver}",
    require => Package["maven-${maven_rpm_ver}"],
  }

}

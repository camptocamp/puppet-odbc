# == Class: odbc::mysql
#
# Installs the MySQL ODBC drivers
#
class odbc::mysql {

  include ::odbc

  package { 'mysql-odbc':
    ensure => present,
    name   => $::odbc::params::mysql_pkg,
  }

  $libpath = $::odbc::params::mysql_libpath
  $libname = $::odbc::params::mysql_libname

  augeas { 'mysql odbc driver config':
    lens    => 'Odbc.lns',
    incl    => '/etc/odbcinst.ini',
    changes => [
      "set MySQL/Description 'ODBC for MySQL'",
      "set MySQL/Driver ${libpath}/${libname}",
      "set MySQL/Setup ${libpath}/libodbcmyS.so",
      'set MySQL/FileUsage 1',
    ],
    require => Package['mysql-odbc'],
  }
}

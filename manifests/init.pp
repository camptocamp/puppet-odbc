# == Class: odbc
#
# Installs the common components of a working ODBC setup.
#
# TODO:
#  - configure /etc/odbcinst.ini for postgresql
#  - have a definition to configure entries in /etc/odbc.ini
#
class odbc (
  $mysql = false,
  $pgsql = false,
) inherits ::odbc::params {
  package { 'unixodbc':
    ensure => present,
    name   => $::odbc::params::unixodbc_pkg,
  }

  if $mysql {
    include ::odbc::mysql
  }

  if $pgsql {
    include ::odbc::pgsql
  }
}

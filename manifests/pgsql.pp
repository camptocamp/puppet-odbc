# == Class: odbc::pgsql
#
# Installs the Postgresql ODBC drivers
#
class odbc::pgsql {

  include ::odbc

  package { 'pgsql-odbc':
    ensure => present,
    name   => $::odbc::params::pgsql_pkg,
  }
}

class odbc::params {
  case $::osfamily {
    'RedHat': {
      case $facts['os']['release']['major'] {
        '8': {
          $mysql_pkg = 'mariadb-connector-odbc'
          $mysql_libpath = '/usr/lib64/'
          $mysql_libname = 'libmyodbc5.so'
        }
        default: {
          $mysql_pkg = 'mysql-connector-odbc'
          $mysql_libname = 'libmyodbc3.so'
          $mysql_libpath = $::architecture ? {
            'x86_64' => '/usr/lib64',
            default  => '/usr/lib',
          }
        }
      }
      $unixodbc_pkg = 'unixODBC'
      $pgsql_pkg = 'postgresql-odbc'
    }

    'Debian': {
      $unixodbc_pkg = 'unixodbc'
      $mysql_pkg = 'libmyodbc'
      $mysql_libname = 'libmyodbc.so'
      $mysql_libpath = '/usr/lib/odbc'
      $pgsql_pkg = 'odbc-postgresql'
    }

    default: {
      fail "Unsupported OS family ${::osfamily}"
    }
  }
}

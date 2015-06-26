class run::mysqld {
  if $general_log {
    include run::mysqld::general_log
  }

  if $slow_query_log {
    include run::mysqld::slow_query_log
  }

  include run::mysqld::long_query_time

  bash_exec { 'mkdir -p /mysqld/data': }
}

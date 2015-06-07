class mysqld {
  if $general_log {
    include mysqld::general_log
  }

  if $slow_query_log {
    include mysqld::slow_query_log
  }

  include mysqld::long_query_time

  bash_exec { 'mkdir -p /mysqld/data': }
}

class run::mysql {
  if $general_log {
    include run::mysql::general_log
  }

  if $slow_query_log {
    include run::mysql::slow_query_log
  }

  include run::mysql::long_query_time

  bash_exec { 'mkdir -p /mysql/data': }
}

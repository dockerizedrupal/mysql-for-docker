class run::mysql {
  include run::mysql::general_log

  if $log_error == "On" {
    include run::mysql::log_error
  }

  include run::mysql::slow_query_log

  include run::mysql::query_cache_type
  include run::mysql::max_allowed_packet
  include run::mysql::key_buffer_size
  include run::mysql::thread_cache_size
  include run::mysql::innodb_buffer_pool_size
  include run::mysql::innodb_flush_log_at_trx_commit

  bash_exec { 'mkdir -p /mysql/data': }
}

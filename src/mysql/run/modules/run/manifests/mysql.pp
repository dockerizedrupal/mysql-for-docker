class run::mysql {
  if $general_log {
    include run::mysql::general_log
  }

  if $slow_query_log {
    include run::mysql::slow_query_log
  }

  if $query_cache_type {
    include run::mysql::query_cache_type
  }

  if $max_allowed_packet {
    include run::mysql::max_allowed_packet
  }

  if $key_buffer_size {
    include run::mysql::key_buffer_size
  }

  if $thread_cache_size {
    include run::mysql::thread_cache_size
  }

  if $innodb_buffer_pool_size {
    include run::mysql::innodb_buffer_pool_size
  }

  bash_exec { 'mkdir -p /mysql/data': }
}

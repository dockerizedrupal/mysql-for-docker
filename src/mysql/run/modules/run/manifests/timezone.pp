class run::timezone {
  bash_exec { "timedatectl set-timezone $timezone": }
}

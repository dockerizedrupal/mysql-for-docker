class mysqld {
  exec { 'mkdir -p /mysqld/data':
    path => ['/bin']
  }
}

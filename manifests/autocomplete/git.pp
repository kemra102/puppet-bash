class bashprofile::autocomplete::git {

  file { '/etc/profile.d/git.sh':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/bashprofile/git.sh',
  }

}

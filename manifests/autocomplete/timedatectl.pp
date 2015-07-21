class bashprofile::autocomplete::timedatectl {

  if $::systemd_available {
    file { '/etc/profile.d/timedatectl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/timedatectl.sh',
    }
  }

}

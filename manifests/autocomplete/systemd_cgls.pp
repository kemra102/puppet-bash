class bash::autocomplete::systemd_cgls {

  if $::systemd_available {
    file { '/etc/profile.d/bootctl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/systemd-cgls.sh',
    }
  }

}

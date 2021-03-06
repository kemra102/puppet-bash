class bash::autocomplete::systemd_detect_virt {

  if $::systemd_available {
    file { '/etc/profile.d/systemd-detect-virt.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/systemd-detect-virt.sh',
    }
  }

}

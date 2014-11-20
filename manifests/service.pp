# == Class: glusterfs::service
#
class glusterfs::service {

  case $::osfamily {
    'redhat': {
        $service_name = 'glusterd'
    }
    'debian': {
        $service_name = 'glusterfs-server'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat and Debian")
    }
  }

  service { $service_name:
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => Package['glusterfs-server']
  }

}

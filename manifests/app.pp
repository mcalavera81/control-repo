node 'node3' {
    
    notify { "**** NODE1 BLOCK ****":    }
    
    class { 'tomcat':
        xms             => '20m',
        xmx             => '300m',
        user            => 'root',
        group           => 'root',
        service_state   => running
    }
    
    tomcat::deploy { "sysfoo":
        deploy_url      => 'https://2-108525006-gh.circle-artifacts.com/0/tmp/circle-artifacts.fbcEDtP/sysfoo.war',
        checksum        => 'md5',
        checksum_value  => '82a88f711b94fa7564da432f2c52643f'
    }
    
}


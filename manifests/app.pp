node 'node1' {
    
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
    
    include base
}

node 'node2' {
    
    notify { "**** NODE2 BLOCK ****":    }
    
    
    class { '::tomcat':
        xms             => '50m',
        xmx             => '320m',
        user            => 'tomcat',
        group           => 'tomcat',
        service_state   => running
        
    }
    
    tomcat::deploy { "sysfoo":
        deploy_url          => 'https://2-108525006-gh.circle-artifacts.com/0/tmp/circle-artifacts.fbcEDtP/sysfoo.war',
        checksum            => 'md5',
        checksum_value      => '82a88f711b94fa7564da432f2c52643f'
    }
    
    include base
}


node default {

    notify { "checkpoint_1":
    
        message     => " ********** DEFAULT BLOCK ********** "
        
    }
}
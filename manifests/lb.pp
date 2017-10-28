node 'node4' {
  include ::haproxy
  haproxy::listen { 'app':
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '80',
    mode             => 'tcp',                       
    options   => {
    'balance' => 'roundrobin',
    },
  }
  haproxy::balancermember { 'app1':
    listening_service => 'tomcat',
    server_names      => 'node1.codespaces.com',
    ipaddresses       => '172.20.0.4',
    ports             => '8080',
    options           => 'check',
  }
  haproxy::balancermember { 'app2':
    listening_service => 'tomcat',
    server_names      => 'node2.codespaces.com',
    ipaddresses       => '172.20.0.5',
    ports             => '8080',
    options           => 'check',
  }
}
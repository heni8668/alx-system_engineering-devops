# Puppet manifests that configures Nginx server

#Install nginx
package { 'nginx':
    ensure => installed,
}

#Create a page that contains the string Hellow World
file { '/var/www/html/index.html':
    content =>  'Hello World!',
}

# Configure Nginx server so that /redirect_me is redirecting to another page.
file_line { 'redirect 301 Moved Permanently':
    path  => '/etc/nginx/sites-available/default',
    after => 'listen 80 default_server',
    line  => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

# Equivalent to the command service nginx restart
service { 'nginx':
    ensure  => running,
    require => Package['nginx'],
}
class httpdinstall{
  $pkg='httpd'
  $service='httpd'
  $files=['/var/www/html/myname.com', '/var/log/httpd/myname.com']

  package { $pkg:
    ensure=>present,
   }

 file{$files:
    ensure=>directory,
    owner=>root,
    group=>root,
  }

 file{'/var/www/html/myname.com/index.html':
     ensure=>present,
     content=>"Test Web service",
 }
 
 file {'/etc/httpd/conf.d/vhost.conf':
   ensure=>present,
   owner=>root,
   group=>root,
   source =>'/var/tmp/vhost.conf',
   notify=>Service[$service]
 }

service{$service:
  ensure=>running,
}
}
include httpdinstall

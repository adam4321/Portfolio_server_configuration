# Repository for the VPS configuration files for my personal portfolio site

## Description

This is the configuration for redirecting http traffic to TLS on port 443
and also redirecting www subdomain redirects to https://adamjwright.com.
After the initial port 80 or 443 entry points, the traffic is redirected
on localhost to the relavant application. Static applications and reverse
proxies are then directed to the appropriate ports on localhost.

## Reload

After any changes to this file Nginx must be restarted. The following command
will execute this -> sudo systemctl reload nginx.

#!/bin/bash

uptimeVar=$(uptime)
lastBootVar=$(last -f /var/log/wtmp.1)
certRangeVar=$(echo | openssl s_client -connect adamjwright.com:443 2>/dev/null | openssl x509 -noout -dates)

mailx -a "Content-Type: text/html" -s "Attention: Monthly Server Reboot" -a From:adam@adamjwright.com adamjw321@gmail.com << EOF
<p style="font-size:18px; color:black; margin-bottom:25px;">Monthly cron automated server reboot notice for adamjwright.com at Digital Ocean</p>

<span style="font-weight:bold; color:black;">Uptime</span>
<p style="color:#222;">$uptimeVar</p>

<span style="font-weight:bold; color:black;">Last Month's Server Reboots</span>
<p style="color:#222; width:400px; line-height:22px;">$lastBootVar</p>

<span style="font-weight:bold; color:black;">SSL Certificate Renewal Range</span>
<p style="color:#222; width:250px; line-height:22px;">$certRangeVar</p>
EOF

sudo reboot


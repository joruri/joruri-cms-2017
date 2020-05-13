#!/bin/bash
DONE_FLAG="/tmp/$0_done"

echo '#### Start servers ####'
if [ -f $DONE_FLAG ]; then exit; fi
echo '-- PRESS ENTER KEY --'
read KEY

centos() {
  echo "It's CentOS!"

  systemctl start postgresql-12 && systemctl enable postgresql-12
  systemctl start nginx && systemctl enable nginx

  cp /var/www/joruri/config/samples/unicorn.service /usr/lib/systemd/system/joruri_unicorn.service
  systemctl start joruri_unicorn && systemctl enable joruri_unicorn

  cp /var/www/joruri/config/samples/delayed_job.service /usr/lib/systemd/system/joruri_delayed_job.service
  systemctl start joruri_delayed_job && systemctl enable joruri_delayed_job

}

others() {
  echo 'This OS is not supported.'
}

if [ -f /etc/centos-release ]; then
  centos
elif [ -f /etc/lsb-release ]; then
  if grep -qs Ubuntu /etc/lsb-release; then
    echo 'Ubuntu is not yet supported.'
  else
    others
  fi
else
  others
fi

touch $DONE_FLAG

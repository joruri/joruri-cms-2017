#!/bin/bash
DONE_FLAG="/tmp/$0_done"

echo '#### Install Joruri ####'
if [ -f $DONE_FLAG ]; then exit; fi
echo '-- PRESS ENTER KEY --'
read KEY

centos() {
  echo "It's CentOS!"

  if [ -d /var/www/joruri ]; then
    echo 'Joruri is already installed.'
    touch $DONE_FLAG
    exit
  fi

  id joruri || useradd -m joruri

  rpm -ivh https://kojipkgs.fedoraproject.org/packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm
  curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
  yum -y install libxml2-devel libxslt-devel openldap-devel nodejs patch zip

  rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
  yum -y install --enablerepo=remi ImageMagick6-devel

  git clone https://github.com/joruri/joruri-cms-2017.git /var/www/joruri
  chown -R joruri:joruri /var/www/joruri
  su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle config build.pg --with-pg-config=/usr/pgsql-9.5/bin/pg_config'
  su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle install --path vendor/bundle --without development test'

  cp /var/www/joruri/config/samples/logrotate /etc/logrotate.d/joruri_logrotate

  cp /var/www/joruri/config/samples/reload_servers.sh /root/. && chmod 755 /root/reload_servers.sh
  ROOT_CRON_TXT='/var/www/joruri/config/samples/root_cron.txt'
  crontab -l > $ROOT_CRON_TXT
  grep -s reload_servers.sh $ROOT_CRON_TXT || echo '0,30 * * * * /root/reload_servers.sh' >> $ROOT_CRON_TXT
  crontab $ROOT_CRON_TXT

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

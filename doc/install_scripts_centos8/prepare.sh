#!/bin/bash

INSTALL_SCRIPTS_URL='https://raw.githubusercontent.com/joruri/joruri-cms-2017/master/doc/install_scripts_centos8'

echo '#### Prepare to install ####'

centos() {
  echo "It's CentOS!"

  setenforce 0
  sed -i --follow-symlinks -e 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/sysconfig/selinux

  dnf config-manager --set-enabled PowerTools

  dnf -y install git epel-release

  cd /usr/local/src

  files=('install_ruby.sh' 'install_nginx.sh' 'install_postgresql.rb' 'install_app.sh'
         'configure_app.rb' 'install_kana_read.sh' 'start_servers.sh' 'install_cron.sh')

  rm -f install_scripts.txt install_all.sh
  for file in ${files[@]}; do
    echo "$INSTALL_SCRIPTS_URL/$file" >> install_scripts.txt
    echo "./$file" >> install_all.sh
    if [ $file = 'install_ruby.sh' ]; then
      echo ". /etc/profile" >> install_all.sh
    fi
    curl -fsSLO "$INSTALL_SCRIPTS_URL/$file"
    chmod 755 $file
  done

cat <<'EOF' >> install_all.sh

echo "
-- インストールを完了しました。 --

  公開画面: `ruby -ryaml -e "puts YAML.load_file('/var/www/joruri/config/core.yml')['production']['uri']"`

  管理画面: `ruby -ryaml -e "puts YAML.load_file('/var/www/joruri/config/core.yml')['production']['uri']"`_system

    管理者（システム管理者）
    ユーザID   : joruri
    パスワード : joruri

１．管理画面にアクセスできない場合、下記のファイルを確認して「server_name」の部分を適宜変更してください。
    # vi /var/www/joruri/config/nginx/servers/site_0001.conf
    # vi /var/www/joruri/config/nginx/admin_servers/site_0001.conf
    --------------
    server_name `ruby -ryaml -e "puts YAML.load_file('/var/www/joruri/config/core.yml')['production']['uri'].gsub(/(^http:\/\/|\/)/,'')"`;
    --------------

    変更後は下記のコマンドを実行して、設定を反映してください。
    # systemctl reload nginx

    管理画面にログイン後、「サイト」の「ドメイン」画面から「サイトURL」の設定値を修正してください。

２．PostgreSQLのjoruriユーザはパスワードがjoruripassに設定されています。適宜変更してください。
    postgres=# ALTER USER joruri WITH ENCRYPTED PASSWORD 'newpass';

３．OS の joruri ユーザに cron が登録されています。
    # crontab -u joruri -l
"
EOF
  chmod 755 install_all.sh

echo '
-- インストールを続けるには以下のコマンドを実行してください。 --

# cd /usr/local/src && /usr/local/src/install_all.sh
'
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

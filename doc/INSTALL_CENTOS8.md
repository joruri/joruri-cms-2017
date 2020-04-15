# joruri インストールマニュアル

## 1.想定環境

### システム

* OS: CentOS 8
* Webサーバ: nginx 1.16
* Appサーバ: unicorn 5.4
* Database: PostgreSQL 12
* Ruby: 2.6
* Rails: 5.2

### 設定

* ホスト名: joruri.example.com

## 2.作業ユーザの変更

rootユーザに変更します。

    $ su -

## 3.SELinuxの変更

SELinuxを変更します。

    # setenforce 0

    # vi /etc/sysconfig/selinux
```
SELINUX=permissive    # 変更
```
*※セキュリティ設定は環境に応じて適切に設定してください。*

## 4.PowerToolsの有効化

PowerToolsを有効にします。

    # dnf config-manager --set-enabled PowerTools

## 5.事前準備

作業に必要なパッケージをインストールします。

    # dnf -y install git epel-release

## 6.Rubyのインストール

必要なパッケージをインストールします。

    # dnf -y install gcc-c++ libffi-devel libyaml-devel make openssl-devel readline-devel zlib-devel bzip2

rbenvをインストールします。

    # git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
    # git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

    # echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
    # echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh
    # echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
    # source /etc/profile.d/rbenv.sh

rubyをインストールします。

    # rbenv install 2.6.1
    # rbenv global 2.6.1
    # rbenv rehash
    # ruby -v

## 7.nginxのインストール

外部からhttpでアクセス可能にします。
※ファイアーウォール設定は環境に応じて適切に設定してください。

    # firewall-cmd --add-service=http --zone=public --permanent
    # firewall-cmd --reload

dnfリポジトリに追加します。

    # vi /etc/yum.repos.d/nginx.repo
```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/8/$basearch/
gpgcheck=0
enabled=1
```

インストールします。

    # dnf -y install nginx

## 8.PostgreSQLのインストール

dnfリポジトリに追加します。

    # dnf -y module disable  postgresql
    # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

インストールします。

    # dnf -y install postgresql12-server postgresql12-contrib postgresql12-devel

データベースを初期化します。

    # export PGSETUP_INITDB_OPTIONS="--encoding=UTF8 --locale=ja_JP.UTF-8"; /usr/pgsql-12/bin/postgresql-12-setup initdb

ユーザ認証方法を変更します。

    # vi /var/lib/pgsql/12/data/pg_hba.conf
```
#host    all             all             127.0.0.1/32            ident
host    all             all             127.0.0.1/32            md5
```

データベースを起動します。

    # systemctl start postgresql-12

joruri用のユーザを作成します。
※パスワードは任意の文字列を設定してください。（ここでは「joruripass」とします。）

    # su - postgres -c "psql -c \"CREATE USER joruri WITH CREATEDB ENCRYPTED PASSWORD 'joruripass';\""

## 9.joruriのインストール

専用ユーザを作成します。

    # useradd -m joruri

必要なパッケージをインストールします。

    # rpm -ivh https://kojipkgs.fedoraproject.org/packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm
    # curl --silent --location https://rpm.nodesource.com/setup_12.x | bash -
    # dnf -y install libxml2-devel libxslt-devel openldap-devel nodejs patch zip exiv2 postfix

    # dnf -y install http://rpms.famillecollet.com/enterprise/remi-release-8.rpm
    # dnf -y install --enablerepo=remi ImageMagick-devel

joruriをインストールします。

    # git clone https://github.com/joruri/joruri-cms-2017.git /var/www/joruri
    # chown -R joruri:joruri /var/www/joruri
    # su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle config build.pg --with-pg-config=/usr/pgsql-12/bin/pg_config'
    # su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle install --path vendor/bundle --without development test'

    # cp /var/www/joruri/config/samples/logrotate /etc/logrotate.d/joruri_logrotate

    # cp /var/www/joruri/config/samples/reload_servers.sh /root/. && chmod 755 /root/reload_servers.sh
    # ROOT_CRON_TXT='/var/www/joruri/config/samples/root_cron.txt'
    # crontab -l > $ROOT_CRON_TXT
    # grep -s reload_servers.sh $ROOT_CRON_TXT || echo '0,30 * * * * /root/reload_servers.sh' >> $ROOT_CRON_TXT
    # crontab $ROOT_CRON_TXT

## 10.Joruriの設定

設定ファイルのサンプルをコピーして変更します。

    # su - joruri -c 'cp -p /var/www/joruri/config/original/*.yml /var/www/joruri/config/'
    # vi /var/www/joruri/config/core.yml
```
uri: http://joruri.example.com/    # すべて変更
```

シークレットキーを設定します。

    # su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec rake secret RAILS_ENV=production'
      (出力されたシークレットキーをコピーします)

    # vi /var/www/joruri/config/secrets.yml
	---
	production:
	  secret_key_base: (コピーしたシークレットキーを貼り付けます)
	---

    # vi /var/www/joruri/config/smtp.yml
	---
	production:
	  address: localhost
	  port: 25
	  domain: localhost
	  user_name:
	  password:
	  authentication:
	  enable_starttls_auto: false   # 追記
	---

    # systemctl start postgresql-12

必要なデータベースを作ります。

    # su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec rake db:setup RAILS_ENV=production'

サンプルデータを登録します。

    # su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec rake db:seed:demo RAILS_ENV=production'

設定ファイルを作成してリンクを作成します。

    # su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec rake joruri:configure RAILS_ENV=production'
    # ln -s /var/www/joruri/config/nginx/nginx.conf /etc/nginx/conf.d/joruri.conf


デフォルトのnginx設定ファイルをリネームします。

    # cp  /etc/nginx/nginx.conf  /etc/nginx/nginx.conf.org
    # vi /etc/nginx/nginx.conf
	 (「server {」の部分を全てコメントアウトします)

## 11.ふりがな・読み上げ機能のインストール

必要なパッケージをインストールします。

    # dnf -y install sox

hts_engine APIをインストールします。

    # cd /usr/local/src
    # curl -fsSLO http://downloads.sourceforge.net/hts-engine/hts_engine_API-1.09.tar.gz
    # tar zxf hts_engine_API-1.09.tar.gz && cd hts_engine_API-1.09 && ./configure CFLAGS='-O3 -march=native -funroll-loops' && make && make install

Open JTalkをインストールします。

    # cd /usr/local/src
    # curl -fsSLO http://downloads.sourceforge.net/open-jtalk/open_jtalk-1.08.tar.gz
    # tar zxf open_jtalk-1.08.tar.gz && cd open_jtalk-1.08
    # sed -i 's/#define MAXBUFLEN 1024/#define MAXBUFLEN 10240/' bin/open_jtalk.c
    # ./configure --with-charset=UTF-8 CFLAGS='-O3 -march=native -funroll-loops' CXXFLAGS='-O3 -march=native -funroll-loops' && make && make install

Dictionaryをインストールします。

    # cd /usr/local/src
    # curl -fsSLO http://downloads.sourceforge.net/open-jtalk/open_jtalk_dic_utf_8-1.08.tar.gz
    # tar zxf open_jtalk_dic_utf_8-1.08.tar.gz
    # mkdir /usr/local/share/open_jtalk && mv open_jtalk_dic_utf_8-1.08 /usr/local/share/open_jtalk/dic

LAMEをインストールします。

    # cd /usr/local/src
    # curl -fsSLO http://jaist.dl.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
    # tar zxf lame-3.99.5.tar.gz && cd lame-3.99.5 && ./configure && make && make install

MeCabをインストールします。

    # cd /usr/local/src
    # curl -fsSL 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE' -o mecab-0.996.tar.gz
    # tar zxf mecab-0.996.tar.gz && cd mecab-0.996 && ./configure --enable-utf8-only && make && make install

MeCab-IPAdicをインストールします。

    # cd /usr/local/src
    # curl -fsSL 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM' -o mecab-ipadic-2.7.0-20070801.tar.gz
    # tar zxf mecab-ipadic-2.7.0-20070801.tar.gz && cd mecab-ipadic-2.7.0-20070801 && ./configure --with-charset=utf8 && make && make install

MeCab-Rubyをインストールします。

    # cd /usr/local/src
    # curl -fsSL 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7VUNlczBWVDZJbE0' -o mecab-ruby-0.996.tar.gz
    # tar zxf mecab-ruby-0.996.tar.gz && cd mecab-ruby-0.996 && ruby extconf.rb && make && make install

libmecabのパスを設定します。

    # echo '/usr/local/lib' >> /etc/ld.so.conf.d/usrlocal.conf
    # sudo ldconfig
    # ldconfig -p | grep "/usr/local/lib"


## 12.サーバーの起動

postgresqlを起動します。

    # systemctl start postgresql-12 && systemctl enable postgresql-12

nginxを起動します。

    # systemctl start nginx && systemctl enable nginx

unicornを起動します。

    # sed -i 's/postgresql-9.5.service/postgresql-12.service/' /var/www/joruri/config/samples/unicorn.service
    # cp /var/www/joruri/config/samples/unicorn.service /usr/lib/systemd/system/joruri_unicorn.service
    # systemctl start joruri_unicorn && systemctl enable joruri_unicorn

delayed_jobを起動します。

    # sed -i 's/postgresql-9.5.service/postgresql-12.service/' /var/www/joruri/config/samples/delayed_job.service
    # cp /var/www/joruri/config/samples/delayed_job.service /usr/lib/systemd/system/joruri_delayed_job.service
    # systemctl start joruri_delayed_job && systemctl enable joruri_delayed_job

postfixを起動します。

    # systemctl start postfix && systemctl enable postfix

## 13.定期実行処理 の設定

ユーザjoruriのcronに処理を追加します。

    # su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec whenever --update-crontab'


## 14.動作確認

インストールが完了しました。

* 公開画面: http://joruri.example.com/
* 管理画面: http://joruri.example.com/_system

* 管理者（システム管理者）
  - ユーザID: joruri
  - パスワード: joruri

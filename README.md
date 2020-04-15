Joruri CMS 2017
==========
Joruri CMS 2017 は、自治体サイト向けに開発された国産オープンソースCMSです。

## 環境

| Software  | Version         | Version       |
|:----------|:----------------|:--------------|
| OS        | CentOS 7.2, 7.7 | CentOS 8.1    |
| Webサーバ | nginx 1.12      | nginx 1.16    |
| Appサーバ | unicorn 5.4     | unicorn 5.4   |
| Database  | PostgreSQL 9.5  | PostgreSQL 12 |
| Ruby      | 2.6             | 2.6           |
| Rails     | 5.2             | 5.2           |

## デモ
https://joruri-cms.jp/2017/about/demo.html

## インストール

### 前提条件
* root権限による操作を想定しています。

### 手動インストールマニュアル

* CentOS 7
  - [doc/INSTALL.md](doc/INSTALL.md)

* CentOS 8
  - [doc/INSTALL_CENTOS8.md](doc/INSTALL_CENTOS8.md)

### 自動スクリプト
CentOS 7での自動インストールスクリプトになります。

    export LANG=ja_JP.UTF-8; curl -fsSL https://raw.githubusercontent.com/joruri/joruri-cms-2017/master/doc/install_scripts/prepare.sh | bash

## ライセンス
MIT License

Copyright (C) Tokushima Prefectural Government, IDS Inc., SiteBridge Inc.
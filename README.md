# Docker 起動コマンド
source docker-start.sh

# Webサーバコンテンナ作成時
```
docker exec -it centos_php script -q -c "/bin/zsh" 
```
でコンテナに入って下記コマンドをおこない、zpreztoとｚｓｈの設定を行う必要があります。
```
setopt EXTENDED_GLOB; for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done;
cat zsh_orig/.zshrc >> .zshrc; source .zshrc
cp -r .autojump /home/www/.autojump; chown -R www:www /home/www/.autojump \
  && cp .zshrc /home/www/.zshrc; chown www:www /home/www/.zshrc \
  && cp .zlogin /home/www/.zlogin; chown www:www /home/www/.zlogin \
  && cp .zlogout /home/www/.zlogout; chown www:www /home/www/.zlogout \
  && cp .zpreztorc /home/www/.zpreztorc; chown www:www /home/www/.zpreztorc \
  && cp .zprofile /home/www/.zprofile; chown www:www /home/www/.zprofile \
  && cp .zshenv /home/www/.zshenv; chown www:www /home/www/.zshenv \
  && cp -r .zprezto /home/www/.zprezto; chown -R www:www /home/www/.zprezto
```
# WebサーバコンテナへのSSH接続Port
docker ps コマンドで表示されるPortを利用する。初期状態は２２０２ポート。docker machine で22番ポートが利用されているので２２は利用できない。

# Virtualbox の 共有フォルダのパーミッションが問題になった場合

## boot2dockerで行う ※docker start する前に行わないといけない
```
＄ docker-machine ssh
```
でboot2dockerに入る

```
＄ sudo mount -t vboxsf -o uid=1000,gid=1000,dmode=777,fmode=777 Users /Users
```
で共有フォルダのパーミッションを変更する

## 次回からdockerのホスト（boot2docker）立ち上げ時に自動で共有フォルダのパーミッションを変更する
```
$ vi /var/lib/boot2docker/bootlocal.sh
```
で下記の内容を記載したbootlocal.shを作成する
```
$ sudo mount -t vboxsf -o uid=1000,gid=1000,dmode=777,fmode=777 Users /Users
```

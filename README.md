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

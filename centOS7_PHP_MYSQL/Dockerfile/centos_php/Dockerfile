FROM centos:7
RUN yum -y install httpd \
    && rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm \
    && yum -y install php70w php70w-opcache php70w-common php70w-mbstring php70w-pdo php70w-pdo_dblib php70w-pgsqll php70w-mysql php70w-common php70w-gd php70w-xml php70w-mcrypt php70w-pecl-xdebug \
    && useradd www \
    && gpasswd -a www apache \
    && echo 'password' | passwd --stdin www \
    && systemctl enable httpd.service \
    && yum -y install openssh-server \
    && systemctl enable sshd.service \
    && touch /var/log/php_error.log \
    && chown apache:apache /var/log/php_error.log
COPY ./add_php.ini /etc/php.d/add_php.ini
COPY ./user_group.conf /etc/httpd/conf.d/user_group.conf
COPY ./modules.conf /etc/httpd/conf.d/modules.conf
COPY ./virtualhosts.conf /etc/httpd/conf.d/virtualhosts.conf
COPY ./sshd_config /etc/ssh/sshd_config
RUN yum -y install zsh less git python-pip \
    && cd; git clone git://github.com/mooz/percol.git; cd percol; python setup.py install;
WORKDIR /root
RUN git clone git://github.com/joelthelion/autojump.git;
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto";

COPY zshrc /root/.zshrc
COPY rc.py /root/.percol.d/rc.py
COPY rc.py /home/www/.percol.d/rc.py

RUN chsh -s /bin/zsh; ls -al; source /root/.zshrc; cd autojump; ./install.py;

RUN cd; mkdir zsh_orig && mv .zshrc zsh_orig;

# zprezto の初期設定に成功しない。
# RUN zsh; setopt EXTENDED_GLOB; for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md; do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done;

# コンテナに入ってから下記コマンドを打つ
# setopt EXTENDED_GLOB; for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done;
# cat zsh_orig/.zshrc >> .zshrc; source .zshrc
# cp -r .autojump /home/www/.autojump; chown -R www:www /home/www/.autojump \
#   && cp .zshrc /home/www/.zshrc; chown www:www /home/www/.zshrc \
#   && cp .zlogin /home/www/.zlogin; chown www:www /home/www/.zlogin \
#   && cp .zlogout /home/www/.zlogout; chown www:www /home/www/.zlogout \
#   && cp .zpreztorc /home/www/.zpreztorc; chown www:www /home/www/.zpreztorc \
#   && cp .zprofile /home/www/.zprofile; chown www:www /home/www/.zprofile \
#   && cp .zshenv /home/www/.zshenv; chown www:www /home/www/.zshenv \
#   && cp -r .zprezto /home/www/.zprezto; chown -R www:www /home/www/.zprezto

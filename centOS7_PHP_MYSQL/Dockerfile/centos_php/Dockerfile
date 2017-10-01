FROM centos:7
RUN yum -y install httpd
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install php70w php70w-opcache php70w-common php70w-mbstring php70w-pdo php70w-pdo_dblib php70w-pgsqll php70w-mysql php70w-common php70w-gd php70w-xml php70w-mcrypt php70w-pecl-xdebug
RUN useradd www
RUN gpasswd -a www apache
RUN systemctl enable httpd.service
COPY ./add_php.ini /etc/php.d/add_php.ini
COPY ./user_group.conf /etc/httpd/conf.d/user_group.conf
COPY ./modules.conf /etc/httpd/conf.d/modules.conf
COPY ./virtualhosts.conf /etc/httpd/conf.d/virtualhosts.conf
RUN yum -y install zsh
RUN yum -y install less
RUN yum -y install git
RUN yum -y install python-pip
RUN cd; git clone git://github.com/mooz/percol.git; cd percol; python setup.py install;
COPY .zshrc /home/www/.zshrc
COPY .zshrc /root/.zshrc
COPY rc.py /root/.percol.d/rc.py
COPY rc.py /home/www/.percol.d/rc.py
RUN cd; git clone git://github.com/joelthelion/autojump.git; cd autojump; ./install.py;
RUN cd; git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"; mkdir zsh_orig && mv zshmv .zlogin .zlogout .zprofile .zshenv .zshrc zsh_orig;
RUN setopt EXTENDED_GLOB; for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done;
RUN prompt sorin
RUN cd; cat zsh_orig/.zshrc >> .zshrc
RUN cp .zshrc /home/www/.zshrc; chown www:www /home/www/.zshrc;
RUN cp .zlogin /home/www/.zlogin; chown www:www /home/www/.zlogin;
RUN cp .zlogout /home/www/.zlogout; chown www:www /home/www/.zlogout;
RUN cp .zpreztorc /home/www/.zpreztorc; chown www:www /home/www/.zpreztorc;
RUN cp .zprofile /home/www/.zprofile; chown www:www /home/www/.zprofile;
RUN cp .zshenv /home/www/.zshenv; chown www:www /home/www/.zshenv;
RUN cp -r .zprezto /home/www/.zprezto; chown -R www:www /home/www/.zprezto;
RUN cp -r .autojump /home/www/.autojump; chown -R www:www /home/www/.autojump;
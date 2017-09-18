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
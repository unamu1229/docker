FROM centos:7
COPY ./php.ini /etc/php.ini
RUN yum -y install httpd
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install php70w php70w-opcache php70w-common php70w-mbstring php70w-pdo php70w-pdo_dblib php70w-pgsqll php70w-mysql php70w-common php70w-gd php70w-xml php70w-mcrypt php70w-pecl-xdebug

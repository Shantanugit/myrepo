FROM          centos:latest
LABEL         Name="Shantanu"
LABEL         Mobile="9818********"
LABEL         Email="shan*****@gmail.com"
ENV           Name=apache
ENV           Pass=redhat
RUN           useradd $Name && echo "$Name:$Pass" |chpasswd  \
              && yum update -y && yum install httpd -y \
              && date > /tmp/report
COPY          index.html /var/www/html
ADD           https://www.free-css.com/assets/files/free-css-templates/download/page269/burger-king.zip /var/www/html
RUN           sed -i "s/Listen 80/LISTEN 8058/g" /etc/httpd/conf/httpd.conf  \
              && chown apache:apache /var/run/httpd /var/log/httpd  \
              && chmod 777 /var/run/httpd   /var/log/httpd
USER          $Name
EXPOSE        8058
WORKDIR       /var/www/html/
CMD           ["/usr/sbin/httpd", "-D", "FOREGROUND"]

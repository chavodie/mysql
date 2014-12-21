FROM fedora:latest
MAINTAINER chavodie dmserrano2010@gmail.com

ENV REFRESEHD_AT 2014_12_21
ENV myPassword=maqueta myHost=%


RUN ["yum", "-y", "update"]
RUN ["yum", "-y", "install", "community-mysql-server"]

WORKDIR /usr/bin
#RUN ["mysqld_safe", "--basedir=/usr"]
RUN ["/usr/libexec/mysqld", "--datadir=/var/lib/mysql", "&&", "mysqladmin", "-u", "root", "password", "$myPasword", "&&", "mysql", "-u", "root", "-p$myPassword", "-e", "grant all privileges on *.* to wordpress@'%' identified by 'wppass';"]
#RUN ["mysql", "-u", "root", "-p$myPassword", "-e", "grant all privileges on *.* to wordpress@'%' identified by 'wppass';"]


#ENTRYPOINT ["mysqld_safe", "--basedir=/usr"]
WORKDIR /usr/libexec
CMD ["/usr/libexec/mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]
EXPOSE 3306

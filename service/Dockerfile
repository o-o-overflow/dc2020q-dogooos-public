FROM ubuntu:20.04

ENV TERM linux
## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update

RUN apt-get install -qq --no-install-recommends python3.8 wget emacs bsdmainutils

#RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1 && \
#    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2 && \
#    echo 0|update-alternatives --config python3

RUN apt-get update && \
    apt-get install -y python3.8-dev python3-pip mysql-server default-libmysqlclient-dev git nginx uwsgi supervisor python3-seccomp

RUN pip3 install termcolor mysqlclient flask bleach fstring ipdb flask_login astroid uwsgi Flask-Script

RUN cd /tmp && git clone https://github.com/pallets/werkzeug.git && cd werkzeug && pip3 install .

RUN useradd -s /usr/sbin/nologin --no-create-home oooser

ARG THE_FLAG="OOO{THiS_iS_NoT_a_DRoiD_oR_a_FLaG}" 
RUN touch /flag && chmod 400 /flag && printf "$THE_FLAG" > /flag && chown oooser:oooser /flag

# nginx setup
COPY setup/default /etc/nginx/sites-available/default
COPY setup/nginx.conf /etc/nginx/nginx.conf

# run db setup
RUN rm -rf /var/lib/mysql

RUN mkdir /var/run/mysqld ; chown mysql:mysql /var/run/mysqld
RUN /usr/sbin/mysqld --initialize-insecure

COPY setup/db.sql /root/db.sql
RUN chmod 0400 /root/db.sql && chown root:root /root/db.sql
#COPY setup/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf && \
    sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

COPY setup/install_db.sh /root/install_db.sh
RUN chmod 0700 /root/install_db.sh && chown root:root /root/install_db.sh

RUN cd /root && /root/install_db.sh

COPY src/ /app
COPY src/dogooo_comments.py /app/dogooo_comments.py
COPY src/wsgi.py /app/wsgi.py
RUN chmod 644 /app/ -R && find /app -type d -print0 |xargs -0 chmod 755

COPY setup/dbcreds.json /
RUN chown oooser:oooser /dbcreds.json && chmod 400 /dbcreds.json

RUN chown oooser:oooser /app/present/images

RUN chmod 500 /app/dogooo_comments.py && chown oooser:oooser /app/dogooo_comments.py
RUN apt install -y strace
COPY setup/supervisord.conf /etc/supervisord.conf
COPY setup/uwsgi.ini /etc/uwsgi.ini

EXPOSE 37453
WORKDIR /
CMD ["/usr/bin/supervisord"]





FROM centos:7


# Base XPRA container for development environments
# https://xpra.org/trac/wiki/Usage/Docker/CentOS
# https://www.xpra.org/trac/wiki/Clients/HTML5

# Experiment: 23/11/2019 to check if still builds working version.

RUN cd /etc/yum.repos.d && \
    curl -O https://winswitch.org/downloads/CentOS/winswitch.repo && \
    dbus-uuidgen >/etc/machine-id 

RUN yum update -q -y && \
    yum install -q -y epel-release && \
    yum --enablerepo=epel install -q -y \
    dejavu-sans-fonts \
	dejavu-sans-mono-fonts \
    git \
    python-websockify \
    vim \
    nano \
    xterm \
    firefox \
    wget \
    which \
    x11-utils \
	xfonts-base \
    xorg-x11-server-Xvfb \
    xpra 

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - &&\
    yum install -y nodejs

COPY index.html /usr/share/xpra/www
COPY entrypoint.sh /
VOLUME /root
EXPOSE 10000

CMD [ "/entrypoint.sh"]

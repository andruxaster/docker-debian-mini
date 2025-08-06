FROM debian:stable-slim

# INSTALL PACKETS
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN apt install -y openssh-server mc psmisc net-tools wget sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

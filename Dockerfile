FROM node:8.8.1

RUN apt-get update && \
	apt-get -y install \
	libgtkextra-dev \
	libgconf2-dev \
	libnss3 \
	libasound2 \
	libxtst-dev \
	libxss1 \
	libx11-xcb1 \
	sudo \
	git

# Replace 1000 with your user / group id
# @todo replace with environment variables
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer

RUN git clone https://github.com/Microsoft/BotFramework-Emulator.git /home/developer/emulator
RUN cd /home/developer/emulator && npm install
RUN cd /home/developer/emulator && npm run build

WORKDIR /home/developer/emulator

CMD ["/usr/local/bin/npm", "start"]

FROM s390x/ibmjava
RUN apt-get -y update
RUN apt-get -y install maven git curl wget bash sudo nodejs tar

RUN curl -fSL "https://download.docker.com/linux/static/stable/s390x/docker-17.09.1-ce.tgz" -o docker.tgz \
   && tar -xzvf docker.tgz \
   && mv docker/docker /usr/local/bin/ \
   && rm -rf docker \
   && rm docker.tgz \
   && docker -v

RUN echo working
RUN mkdir myHome
RUN cd myHome && git clone https://github.com/FutureApp/mainFrameEclipse.git
RUN echo "hellO"
RUN sudo apt-get -y  install openjdk-8-jre icedtea-8-plugin 
RUn sudo apt-get -y install openjdk-8-jdk openjdk-8-demo openjdk-8-doc openjdk-8-jre-headless openjdk-8-source 


CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"

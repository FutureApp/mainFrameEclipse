FROM my-buntu
RUN echo "dev is building and used"

EXPOSE 4403 8080 8000 9876 22

    
RUN apt-get -y update
RUN apt-get -y install sudo

#---------------------------------------------- [By Framework] ---  
RUN apt-get -y install build-essential bash g++ gcc bzip2 make golang


#---------------------------------------------- [NEW one] ---  
RUN apt-get -y install wget unzip sed git ant

#---------------------------------------------- [NEEDED] ---  
RUN apt-get -y install maven nodejs 
#---------------------------------------------- [Not working] ---  
#RUN apt-get -y install plexus-classworlds glibc-devel


RUN apt-get -y update

#---------------------------------------------- [USER] ---
# WORKING
RUN sudo useradd -m user
RUN sudo usermod -a -G root user

#---------------------------------------------- [TOMCAT 8] ---
# MAYBE WORKING
ENV TOMCAT_VERSION=8.5.23

#---------------------------------------------- [EXTRAS] ---
RUN sudo apt-get -y update
RUN sudo apt-get -y install build-essential checkinstall unzip golang man python
RUN sudo apt-get -y install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
RUN cd /usr/src
RUN sudo wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz && sudo tar xzf Python-2.7.14.tgz
RUN cd Python-2.7.14 && sudo ./configure && sudo make altinstall

RUN mkdir $HOME/.m2 && \
   wget -O  /home/user/tomcat8.zip "http://maven.codenvycorp.com/content/groups/public/org/eclipse/che/lib/che-tomcat8-slf4j-logback/6.0.0-M1/che-tomcat8-slf4j-logback-6.0.0-M1.zip" ;\
   unzip   /home/user/tomcat8.zip -d /home/user/tomcat8;\
   rm /home/user/tomcat8.zip;\
   mkdir /home/user/tomcat8/webapps;\
   sed -i -- 's/autoDeploy=\"false\"/autoDeploy=\"true\"/g' /home/user/tomcat8/conf/server.xml; \
   sed -i 's/<Context>/<Context reloadable=\"true\">/g' /home/user/tomcat8/conf/context.xml; \
   echo "export MAVEN_OPTS=\$JAVA_OPTS" >> /home/user/.bashrc  


#---------------------------------------------- [NOT WORKED ON] ---
ENV LD_LIBRARY_PATH=usr/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} \
 M2_HOME=/usr/share/maven \
 GOPATH=/usr/bin/go \
 TERM=xterm  \
 NPM_RUN=start \
 NPM_CONFIG_PREFIX=$HOME/.npm- \
 TOMCAT_HOME=/home/user/tomcat8 \
 MANPATH=/usr/share/man:$MANPATH \
 PYTHONPATH=usr/lib/python2.7/${PYTHONPATH:+:${PYTHONPATH}} \
 NODEJS_VERSION=4.2.6
 
 
 ENV PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:$GOPATH/bin:$M2_HOME/bin:/opt/rh/rh-nodejs6/root/usr/bin:/usr/local/go/bin:$PATH
 ENV PATH=$HOME/node_modules/.bin/::$GOPATH:$M2_HOME/bin:$PATH
#---------------------------------------------- [NOT WORKED ON] ---
#ENV LD_LIBRARY_PATH=/opt/rh/rh-nodejs6/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} \
# PYTHONPATH=/opt/rh/rh-nodejs6/root/usr/lib/python2.7/site-packages${PYTHONPATH:+:${PYTHONPATH}} \
# MANPATH=/opt/rh/rh-nodejs6/root/usr/share/man:$MANPATH \
# TOMCAT_HOME=/home/user/tomcat8 \
# TERM=xterm  \
# M2_HOME=/opt/rh/rh-maven35/root/usr/share/maven \
# GOPATH=$HOME/go \
# NODEJS_VERSION=6 \
# NPM_RUN=start \
# NPM_CONFIG_PREFIX=$HOME/.npm-
# 
# ENV PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:$GOPATH/bin:$M2_HOME/bin:/opt/rh/rh-nodejs6/root/usr/bin:/usr/local/go/bin:$PATH
 
 RUN mkdir /home/user/traefik ;\
     wget -O /home/user/traefik/traefik "https://github.com/containous/traefik/releases/download/v1.4.3/traefik_linux-amd64"; \
     chmod +x /home/user/traefik/traefik
 COPY traefik.toml /home/user/traefik/
 ADD entrypoint.sh /home/user/entrypoint.sh
 RUN sudo mkdir /var/run/sshd && \
     sudo  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
     sudo  ssh-keygen -t rsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
     sudo  ssh-keygen -t rsa -f /etc/ssh/ssh_host_ed25519_key -N '' && \
#    npm install -g typescript@2.5.3 typescript-language-server@0.1.4 && \
     sudo chgrp -R 0 ~ && \
     sudo chmod -R g+rwX ~
 WORKDIR /projects
 ENTRYPOINT ["/home/user/entrypoint.sh"]
 CMD tail -f /dev/null

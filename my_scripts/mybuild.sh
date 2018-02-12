mkdir /home/linux1/work && mkdir /home/linux1/work/che && cd /home/linux1/work && git clone https://github.com/FutureApp/mainFrameEclipse.git && \
cp -r /home/linux1/work/mainFrameEclipse/. /home/linux1/work/che 
cd /home/linux1/work/che && git pull 
sudo docker build -t "my-buntu" /home/linux1/work/che/dockerfiles/my_godBuntu/.
	
sudo docker build -t "my-alpine" /home/linux1/work/che/dockerfiles/my_alpine/.
sudo docker build -t "alpine:3.4" /home/linux1/work/che/dockerfiles/my_alpine/.
sudo docker build -t "alpine:3.5" /home/linux1/work/che/dockerfiles/my_alpine/.

sudo docker build -t "puppet/puppet-agent-alpine" /home/linux1/work/che/dockerfiles/my_dockers/puppet-agent/.
sudo docker build -t "maven:3.3-jdk-8" /home/linux1/work/che/dockerfiles/my_godBuntu/.



cd /home/linux1/work/ && sudo chmod -v -R 777 che

# Kommentier mich aus, wenn ich einmal gelaufen bin :D
#cd /home/linux1/work/che/assembly/assembly-main  && sudo mvn clean install	



# Ich muss immer laufen
cd /home/linux1/work/che/dockerfiles/ && sudo  bash build.sh
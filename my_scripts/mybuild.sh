 mkdir /home/linux1/work1 && sudo mkdir /home/linux1/work1/che && cd /home/linux1/work1 && git clone https://github.com/FutureApp/mainFrameEclipse.git 
 cp /home/linux1/work1/mainFrameEclipse/* /home/linux1/work1/che 
sudo docker build -t "my-buntu" /home/linux1/work1/che/dockerfiles/my_godBuntu/.
sudo docker build -t "my-alpine" /home/linux1/work1/che/dockerfiles/my_alpine/.
sudo docker build -t "puppet/puppet-agent-alpine" /home/linux1/work1/che/dockerfiles/my_dockers/puppet-agent/.
	
sudo docker build -t "maven:3.3-jdk-8" /home/linux1/work1/che/dockerfiles/my_godBuntu/.
cd /home/linux1/work1/che/dockerfiles/
sudo bash ./build.sh

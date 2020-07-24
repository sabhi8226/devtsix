FROM centos
RUN yum install wget -y
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install java-11-openjdk.x86_64 -y
RUN yum install jenkins -y
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "java -jar /usr/lib/jenkins/jenkins.war &" >> /root/.bashrc

RUN yum install httpd -y
RUN yum install -y openssh-server
RUN yum install python36 -y
RUN yum install net-tools -y
RUN yum install git -y

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN mkdir .kube
COPY client.crt /root/
COPY client.key /root/
COPY ca.crt /root/
COPY config /root/.kube/

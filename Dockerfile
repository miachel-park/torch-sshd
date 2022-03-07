FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel 

RUN apt-get update 
RUN apt-get install -y openssh-server git vim 

RUN mkdir /var/run/sshd 

# bash.bashrc에 PATH=/opt/conda/bin:${PATH}, LD_LIBRARY_PATH=/opt/conda/lib:${LD_LIBRARY_PATH} 추가 
RUN echo 'export PATH=/opt/conda/bin:${PATH}' >> /etc/bash.bashrc 
RUN echo 'export LD_LIBRARY_PATH=/opt/conda/bin:${LD_LIBRARY_PATH}' >> /etc/bash.bashrc 

# root passwd 설정 
# NOTE : 최초 접속이후 root password 변경요망 
RUN echo 'root:airoot' | chpasswd 

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config 
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config 

RUN mkdir /root/.ssh 

# workspace 생성
RUN mkdir -p /workspace 

RUN apt-get clean && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

EXPOSE 22 

CMD    ["/usr/sbin/sshd", "-D"] 
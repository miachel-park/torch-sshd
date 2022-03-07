# torch-sshd

Dockerized PyTorch deep learning framework running SSH service, built on top of pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel

## Installed Packages

* OpenSSH_7.6p1 Ubuntu-4ubuntu0.6, OpenSSL 1.0.2n
* git version 2.17.1
* VIM - Vi IMproved 8.0
* Python packages
  * backcall               0.2.0
  * beautifulsoup4         4.9.3
  * brotlipy               0.7.0
  * certifi                2020.12.5
  * cffi                   1.14.3
  * chardet                3.0.4
  * conda                  4.9.2
  * conda-build            3.21.4
  * conda-package-handling 1.7.2
  * cryptography           3.2.1
  * decorator              4.4.2
  * dnspython              2.1.0
  * filelock               3.0.12$
  * glob2                  0.7
  * idna                   2.10
  * ipython                7.21.0
  * ipython-genutils       0.2.0
  * jedi                   0.17.0
  * Jinja2                 2.11.3
  * libarchive-c           2.9
  * MarkupSafe             1.1.1
  * mkl-fft                1.3.0
  * mkl-random             1.1.1
  * mkl-service            2.3.0
  * numpy                  1.19.2
  * olefile                0.46
  * parso                  0.8.1
  * pexpect                4.8.0
  * pickleshare            0.7.5
  * Pillow                 8.1.1
  * pip                    20.2.4
  * pkginfo                1.7.0
  * prompt-toolkit         3.0.8
  * psutil                 5.8.0
  * ptyprocess             0.7.0
  * pycosat                0.6.3
  * pycparser              2.20
  * Pygments               2.8.0
  * pyOpenSSL              19.1.0
  * PySocks                1.7.1
  * python-etcd            0.4.5
  * pytz                   2021.1
  * PyYAML                 5.4.1
  * requests               2.24.0
  * ruamel-yaml            0.15.87
  * setuptools             50.3.1.post20201107
  * six                    1.15.0
  * soupsieve              2.2
  * torch                  1.8.0
  * torchelastic           0.2.2
  * torchtext              0.9.0
  * torchvision            0.9.0
  * tqdm                   4.51.0
  * traitlets              5.0.5
  * typing-extensions      3.7.4.3
  * urllib3                1.25.11
  * wcwidth                0.2.5
  * wheel                  0.35.1

## Config

* PermitRootLogin yes
* UsePAM no
* exposed port 22
* default command: /usr/sbin/sshd -D
* root password: airoot

## Run example

### ssh 접속

\$ docker run -d -P --name torch-sshd torch-sshd:1.0

\$ docker port torch-sshd 22

    0.0.0.0:41690
    ....:41690
\$ ssh root@localhost:41690

    root@torch-sshd $

### vscode 접속

vscode에 Remote - ssh extention 설치

vscode SSH Configuration File 접속정보 추가

    Host <접속 이름>
        HostName : <torch-sshd docker host ip>
        User : root
        Port : <exposed port>

vscode Connect Current Window to Host 클릭


FROM ubuntu:20.04

WORKDIR /root
RUN apt-get update && apt-get install -y build-essential wget vim unzip git python3
RUN apt-get --no-install-recommends install openjdk-11-jdk -y

RUN git clone https://github.com/unixnme/mutli-sense-embedding.git multisense
WORKDIR /root/multisense
RUN wget 'https://onedrive.live.com/download?cid=70E885CC72F916BC&resid=70E885CC72F916BC%215680&authkey=AGm2uPHbNxHL3Yk' -O 1bil.test.txt.bz2
RUN bunzip2 1bil.test.txt.bz2
RUN python3 preprocessing/WordIndexNumDic.py 100000 dict freq index 1bil.test.txt

WORKDIR /root/multisense/joint_training
RUN javac CRP_multi_sense.java 

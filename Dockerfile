FROM centos:7
 
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN yum update -y && \
yum install -y curl && \
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
yum install -y curl unzip && \
yum install -y yum-utils && \
yum groupinstall -y development && \
yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
yum install -y python35u && \
yum install -y python35u-pip && \
yum install -y python35u-devel && \
yum clean all

# http://blog.stuart.axelbrooke.com/python-3-on-spark-return-of-the-pythonhashseed
ENV PYTHONHASHSEED 0
ENV PYTHONIOENCODING UTF-8
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYSPARK_PYTHON python3.5

# SPARK
ARG SPARK_ARCHIVE=http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
ENV SPARK_HOME /usr/local/spark-2.1.0-bin-hadoop2.7
 
ENV PATH $PATH:${SPARK_HOME}/bin
RUN curl -s ${SPARK_ARCHIVE} | tar -xz -C /usr/local/
 
WORKDIR $SPARK_HOME

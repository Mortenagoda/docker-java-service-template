FROM ubuntu:latest

ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java
ENV GITHUB_USR Mortenagoda
ENV GIT_PRJ jax-rs-service-template-swarm

RUN apt-get update
RUN apt-get install -y --force-yes --no-install-recommends \
	git \
	maven \
	openjdk-${JAVA_VER}-jre

RUN git clone https://github.com/${GITHUB_USR}/${GIT_PRJ}.git
RUN cd ${GIT_PRJ}
RUN export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VER}-openjdk-amd64/"
RUN mvn package

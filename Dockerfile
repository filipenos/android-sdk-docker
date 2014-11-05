FROM ubuntu

MAINTAINER filipenos@gmail.com

#Troubleshooting Ubuntu
RUN dpkg --add-architecture i386

RUN apt-get update -y && \
	apt-get install -y openjdk-7-jdk wget curl \
		libncurses5:i386 libstdc++6:i386 zlib1g:i386 && \
	apt-get clean 

RUN curl http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz | tar xzf - -C /opt 

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN echo y | android update sdk --no-ui --all --filter platform-tools
RUN echo y | android update sdk --no-ui --all --filter android-21
RUN echo y | android update sdk --no-ui --all --filter build-tools-21.0.2

RUN wget https://raw.githubusercontent.com/mbrubeck/android-completion/master/android \
	 -O /etc/bash_completion.d/android && \
	 echo ". /etc/bash_completion.d/android" >> ~/.bashrc

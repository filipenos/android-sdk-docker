FROM ubuntu

MAINTAINER filipenos@gmail.com

#Troubleshooting Ubuntu
RUN dpkg --add-architecture i386

RUN apt-get update -y
RUN apt-get install -y openjdk-7-jdk wget curl
RUN apt-get install -y libncurses5:i386 libstdc++6:i386 zlib1g:i386
RUN apt-get clean 

RUN wget http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz -O android-sdk.tgz
RUN tar xf android-sdk.tgz -C /opt
RUN rm android-sdk.tgz

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN yes | android update sdk --no-ui

RUN wget https://raw.githubusercontent.com/mbrubeck/android-completion/master/android -O /etc/bash_completion.d/android
RUN echo ". /etc/bash_completion.d/android" >> ~/.bashrc

FROM frolvlad/alpine-openjdk7
MAINTAINER Korwin Stevens

RUN mkdir -p /project/resource/AppDLicenseReports/reports

# Update APK and install git & bash
RUN apk update && apk add git bash

# Gather the files required
# Apache Ant required for building java apps from AppD
RUN wget http://apache.osuosl.org/ant/binaries/apache-ant-1.9.9-bin.tar.gz -P /project/resource

# Extract Ant
RUN tar -xf /project/resource/apache-ant-1.9.9-bin.tar.gz -C /project/resource


# Git repos for AppDLicense Count and AppD Rest SDK
RUN git clone https://github.com/Appdynamics/AppDLicenseCount.git /project/resource/AppDLicenseReports/AppDLicenseCount
RUN git clone https://github.com/Appdynamics/AppDRESTAPI-SDK.git /project/resource/AppDLicenseReports/AppDRESTAPI-SDK

# Build the Java applications
RUN /project/resource/apache-ant-1.9.9/bin/ant -f /project/resource/AppDLicenseReports/AppDRESTAPI-SDK/AppD_build.xml
RUN /project/resource/apache-ant-1.9.9/bin/ant -f /project/resource/AppDLicenseReports/AppDLicenseCount/AppD_build.xml

# Get the script to run the job
COPY controller.cfg /project/resource/controller.cfg
COPY AppDCron.sh /project/resource/AppDCron.sh

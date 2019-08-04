#!/bin/bash
cat /etc/redhat-release
yum install -y epel-release
yum install -y python-pip
pip install --upgrade pip
pip install apache-beam==2.13.0
tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
yum clean all
yum  repolist
yum install -y google-cloud-sdk
python  wordcount.py     --runner DataflowRunner     --project adminmediaanalytics     --staging_location gs://niraj_ad/staging     --temp_location gs://niraj_ad/temp     --template_location gs://niraj_ad/templates/wordcount

#!/bin/bash
cat /etc/redhat-release
yum install -y epel-release
yum install -y python-pip
pip install --upgrade pip
pip install --upgrade setuptools
pip install apache-beam[gcp]
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
python  wordcount.py     --runner DataflowRunner     --project adminmediaanalytics     --staging_location gs://wordcount_template/staging     --temp_location gs://wordcount_template/temp     --template_location gs://wordcount_template/templates/wordcount

#!/bin/bash
cat /etc/redhat-release
yum install -y epel-release
yum install -y python-pip
pip install --upgrade pip
pip install apache-beam==2.13.0
python  wordcount.py     --runner DataflowRunner     --project adminmediaanalytics     --staging_location gs://niraj_ad/staging     --temp_location gs://niraj_ad/temp     --template_location gs://niraj_ad/templates/wordcount

#!/bin/bash
cat /etc/redhat-release
sudo yum install python-pip
pip install apache-beam[gcp]
python  wordcount.py     --runner DataflowRunner     --project adminmediaanalytics     --staging_location gs://niraj_ad/staging     --temp_location gs://niraj_ad/temp     --template_location gs://niraj_ad/templates/wordcount

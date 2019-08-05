#!/bin/bash
echo $PROJECT
echo $BUILD
cat /etc/redhat-release
yum install -y epel-release
yum install -y python-pip
pip install --upgrade pip
pip install --upgrade setuptools
pip install apache-beam[gcp]
python  wordcount.py --runner DataflowRunner --project $project_id --staging_location gs://wordcount_template/staging --temp_location gs://wordcount_template/temp --template_location gs://wordcount_template/templates/wordcount

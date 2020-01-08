#!/bin/bash

# This is install for airflow(1.10.6)
# Environment CentOS 7
# This script is just for xVan.

# 基本环境搭建
yum install -y epel-release
yum install -y gcc python3-devel mysql-devel krb5-devel gcc-c++ cyrus-sasl-devel mysql redis
cd /root
mkdir ./airflow && cd ./airflow
python3 -m venv ./venv
source ./venv/bin/activate
pip install -r /root/airflow_install/requirements.txt
cp /root/airflow_install/airflow.cfg /root/airflow/
airflow initdb

# 修改.bash_profile
echo "AIRFLOW_HOME=/root/airflow" >> /root/.bash_profile
echo "export AIRFLOW_HOME" >> /root/.bash_profile
# echo "AIRFLOW_HOME="
# echo "export SITE_AIRFLOW_HOME" >> /root/.bash_profile
# echo 'PATH=$PATH:$HOME/bin:$SITE_AIRFLOW_HOME/bin' >> /root/.bash_profile

# 修改airflow时区
# 采用直接文件替换,考虑到版本对应
# 注意对应路径
mv /root/airflow/venv/lib/python3.6/site-packages/airflow/utils/timezone.py /root/airflow_install/timezone.py.backup
cp /root/airflow_install/timezone.py /root/airflow/venv/lib/python3.6/site-packages/airflow/utils/
mv /root/airflow/venv/lib/python3.6/site-packages/airflow/utils/sqlalchemy.py /root/airflow_install/sqlalchemy.py.backup
cp /root/airflow_install/sqlalchemy.py /root/airflow/venv/lib/python3.6/site-packages/airflow/utils/
mv /root/airflow/venv/lib/python3.6/site-packages/airflow/www/templates/admin/master.html /root/airflow_install/master.html.backup
cp /root/airflow_install/master.html /root/airflow/venv/lib/python3.6/site-packages/airflow/www/templates/admin/

# 添加systemd文件
cp /root/airflow_install/airflow /etc/sysconfig/
cp /root/airflow_install/airflow-webserver.service /usr/lib/systemd/system/
cp /root/airflow_install/airflow-scheduler.service /usr/lib/systemd/system/
cp /root/airflow_install/airflow-worker.service /usr/lib/systemd/system/


echo "finish ... wait 5s ..."
sleep 5

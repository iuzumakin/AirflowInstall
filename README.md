# AirflowInstall
Auto install Airflow(1.10.6) and it use celery_executor
## Notices
1.The mysql server is not installed, you need edit airflow.cfg to change mysql connect information

2.I just test in Aliyun CentOS7.7 environment and it works well

3.You should know it runs as root, it maybe not in safe. you can edit some files with using other user

4.The default_timezone is Asia/Shanghai and not utc. Source code is changed.

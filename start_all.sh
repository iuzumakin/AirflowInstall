#!/bin/bash

echo "start webserver, scheduler, worker ..."
systemctl start airflow-webserver
echo "finish webserver ..."
systemctl start airflow-scheduler
echo "finish scheduler ..."
systemctl start airflow-worker
echo "finish all ..."
echo "start to sleep 5s ..."
sleep 5

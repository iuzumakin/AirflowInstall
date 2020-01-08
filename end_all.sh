#!/bin/bash

echo "End webserver, scheduler, worker ..."
systemctl stop airflow-scheduler
echo "End scheduler ..."
systemctl stop airflow-worker
echo "End worker ..."
systemctl stop airflow-webserver
echo "End all ..."

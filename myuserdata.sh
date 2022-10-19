#!/bin/bash
mkdir /opt/meuarquivo/
chmod 777 /opt/meuarquivo/ -R
aws s3 cp s3://jlembeck-bucket-001/index.html /opt/meuarquivo/index.html
chmod 777 /opt/meuarquivo/
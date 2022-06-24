#!/usr/bin/bash

# Install packages
yum -y update
yum install -y python3 git gcc python3-devel
amazon-linux-extras install -y postgresql13
yum install -y postgresql-devel
pip3 install --user psycopg2

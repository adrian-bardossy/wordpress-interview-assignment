#!/bin/bash
set -e

apt update -y && apt upgrade -y
apt install -y mariadb-client
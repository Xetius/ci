#!/bin/bash
set -e
echo "Installing Python..."
export DEBIAN_FRONTEND=noninteractive
apt-get update -qqy
apt-get install -y python-dev


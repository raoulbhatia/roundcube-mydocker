#!/usr/bin/env sh
set -e

docker pull roundcube/roundcubemail:1.5.x-apache

docker build -t raoulbhatia/roundcubemail:1.5.x-rrab .

docker push raoulbhatia/roundcubemail:1.5.x-rrab

#docker tag raoulbhatia/roundcubemail:1.5.x-rrab raoulbhatia/roundcubemail:latest
#docker push raoulbhatia/roundcubemail:latest

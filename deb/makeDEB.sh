#!/bin/bash

cd deb_package
find * -type f ! -regex '^DEBIAN/.*' -exec md5sum {} \; > DEBIAN/md5sums

sudo chown -hR root:root *
sudo chmod 644 DEBIAN/control
sudo chmod 644 DEBIAN/md5sums

cd ..

sudo dpkg-deb -b deb_package ubuntu-karmic-theme-repository/debs/ubuntu-karmic-theme_13.04-1_all.deb

lintian ubuntu-karmic-theme-repository/debs/ubuntu-karmic-theme_13.04-1_all.deb

sudo dpkg-scanpackages ubuntu-karmic-theme-repository/debs /dev/null | gzip > ubuntu-karmic-theme-repository/Packages.gz


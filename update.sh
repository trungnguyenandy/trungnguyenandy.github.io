#!/bin/bash
rm -f Packages*
dpkg-scanpackages debs /dev/null > Packages
gzip -9fk Packages
bzip2 -9fk Packages

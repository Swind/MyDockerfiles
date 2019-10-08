#! /bin/sh

SITEPACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

echo "===== Python Information ====="
echo "version: $(python --version)"
echo "site-packages: ${SITEPACKAGES_PATH}"

echo "===== Installing python-apt ====="
cd /tmp
apt-get update
apt-get download python3-apt
rm -rf /var/lib/apt/lists/* /var/cache/apt/*

PACKAGE_FILE_NAME=$(ls | grep python3-apt_)
dpkg -x ${PACKAGE_FILE_NAME} python3-apt

echo "===== Copy python3-apt to site-packages - ${SITEPACKAGES_PATH}"
cp -r ./python3-apt/usr/lib/python3/dist-packages/* ${SITEPACKAGES_PATH}

mv ${SITEPACKAGES_PATH}/apt_pkg.cpython-35m-x86_64-linux-gnu.so ${SITEPACKAGES_PATH}/apt_pkg.so
mv ${SITEPACKAGES_PATH}/apt_inst.cpython-35m-x86_64-linux-gnu.so ${SITEPACKAGES_PATH}/apt_inst.so

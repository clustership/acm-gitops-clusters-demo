#!/bin/bash

cluster=${1:-sno-demo-10}

mkdir -p ${cluster}
cp -r sno-demo-03/* ${cluster}

cd ${cluster}

sed -i "s/sno-demo-03/${cluster}/g" *.yaml

cd ..

cat <<EOF
Create new cluster by adding definition to git repo:
git add ${cluster}
git commit -m "Add new cluster definition for deployment: ${cluster}" ${cluster}
git push origin main
EOF

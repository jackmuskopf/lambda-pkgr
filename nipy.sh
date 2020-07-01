#!/bin/bash

PYTHON_VERSION=3.7

rm -rf ./pkg
docker run -v "$PWD":/var/task "lambci/lambda:build-python$PYTHON_VERSION" /bin/sh -c "pip install -r nipy-requirements.txt -t pkg/ && pip install numpy==1.16.4 && pip install --no-deps nipy -t pkg/; exit"
(cd pkg && zip -r9 ../pkg.zip . > /dev/null)
rm -rf ./pkg

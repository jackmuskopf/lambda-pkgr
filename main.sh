#!/bin/bash

PYTHON_VERSION=3.7

rm -rf ./pkg
docker run -v "$PWD":/var/task "lambci/lambda:build-python$PYTHON_VERSION" /bin/sh -c "pip install -r requirements.txt -t pkg/; exit"
(cd pkg && zip -r9 ../pkg.zip .)
rm -rf ./pkg

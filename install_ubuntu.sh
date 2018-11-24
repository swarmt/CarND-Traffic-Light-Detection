#!/usr/bin/env bash

# Install tensorflow and dependencies
sudo apt-get install build-essential protobuf-compiler python-pip python-lxml python-tk python-setuptools
pip install -r requirements.txt

# Clone tensorflow models and checkout version compatible with 1.4.1
git clone https://github.com/tensorflow/models.git
cd models
git checkout f7e99c0
cd ..

# Clone and install cocoapi
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
make
cp -r pycocotools ../../models/research/
cd ../..

# Compile protobufs
cd models/research/
protoc object_detection/protos/*.proto --python_out=.
cd ../..

# Download and unzip models
wget -nc http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_2017_11_17.tar.gz
tar -xvzf ssd_mobilenet_v1_coco_2017_11_17.tar.gz -C models/
wget -nc http://download.tensorflow.org/models/object_detection/ssd_inception_v2_coco_2017_11_17.tar.gz
tar -xvzf ssd_inception_v2_coco_2017_11_17.tar.gz -C models/

# Update PYTHON_PATH
export PYTHONPATH=${PYTHONPATH}:`pwd`/models/research:`pwd`/models/research/slim

# Test installation
python models/research/object_detection/builders/model_builder_test.py

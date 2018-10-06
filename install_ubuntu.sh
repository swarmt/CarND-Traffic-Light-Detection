#!/usr/bin/env bash

# Install tensorflow and dependencies
sudo apt-get install build-essential protobuf-compiler python-pip python-lxml python-tk python-setuptools
pip install -r requirements.txt

# Clone tensorflow models and checkout version compatible with 1.5.0
git clone https://github.com/tensorflow/models.git
cd models
git checkout f7e99c0
cd ..

# Patch exporter.py for tensorflow 1.5.0
sed -i -e 's/optimize_tensor_layout/layout_optimizer/g' models/research/object_detection/exporter.py

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

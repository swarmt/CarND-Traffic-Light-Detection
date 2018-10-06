#!/bin/bash
model=$1 # ssd_inception | ssd_mobilenet
tf_research_path=./models/research
export PYTHONPATH=${PYTHONPATH}:${tf_research_path}:${tf_research_path}/slim

mkdir -p models/training_${model}
python ${tf_research_path}/object_detection/train.py \
    --pipeline_config_path=config/${model}.config \
    --train_dir=models/training_${model}

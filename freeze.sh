#!/bin/bash
model=$1 # ssd_inception | ssd_mobilenet
ckpt_ver=$2 # model checkpoint version
tf_research_path=./models/research
export PYTHONPATH=${PYTHONPATH}:${tf_research_path}:${tf_research_path}/slim

python ${tf_research_path}/object_detection/export_inference_graph.py \
    --pipeline_config_path=config/${model}.config \
    --trained_checkpoint_prefix=models/training_${model}/model.ckpt-${ckpt_ver} \
    --output_directory=models/frozen_${model}/

#!/bin/bash
model=$1 # ssd_inception | ssd_mobilenet
tensorboard --logdir=models/training_${model}

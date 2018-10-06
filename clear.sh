#!/bin/bash
model=$1 # ssd_inception | ssd_mobilenet
rm models/training_${model}/events.out.*
rm -r models/training_${model}
rm -r models/frozen_${model}

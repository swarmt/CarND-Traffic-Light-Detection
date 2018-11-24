# Udacity Self Driving Car Capstone

This repo contains the scripts for training the traffic light detector for the capstone project.

#### Installation
Run `install_ubuntu.sh`

You may want to run this script in a virtualenv.

`requirements.txt` contains tensorflow 1.4.1

#### Training
`./train.sh <ssd_inception | ssd_mobilenet>`

#### Freeze
`./freeze.sh <ssd_inception | ssd_mobilenet>`

If you have trained the model a version of tensorflow > 1.4.1 you can create a virtualenv with `requirements.txt` installed and run this script.

#### Visualize
`inference.ipynb`

#### Credits
https://github.com/oflucas/Traffic-Light-Detection

https://github.com/alex-lechner/Traffic-Light-Classification

https://github.com/coldKnight/TrafficLight_Detection-TensorFlowAPI

#!/bin/bash

bazel build -c opt --define MEDIAPIPE_DISABLE_GPU=1 \
mediapipe/examples/desktop/object_detection:object_detection_tflite

GLOG_logtostderr=1 bazel-bin/mediapipe/examples/desktop/object_detection/object_detection_tflite   \
--calculator_graph_config_file=mediapipe/graphs/object_detection/object_detection_desktop_tflite_graph.pbtxt \
--input_side_packets=input_video_path=/home/phuclm/video.mp4,output_video_path=/home/phuclm/video-w-labale.mp4
#!/bin/bash

bazel build -c opt --define MEDIAPIPE_DISABLE_GPU=1 --define no_aws_support=true --linkopt=-s \
mediapipe/examples/desktop/object_detection:object_detection_tensorflow

GLOG_logtostderr=1 bazel-bin/mediapipe/examples/desktop/object_detection/object_detection_tensorflow \
  --calculator_graph_config_file=mediapipe/graphs/object_detection/object_detection_desktop_tensorflow_graph.pbtxt \
  # --input_side_packets=input_video_path=/home/phuclm/video.mp4,output_video_path=/home/phuclm/video-w-obj.mp4
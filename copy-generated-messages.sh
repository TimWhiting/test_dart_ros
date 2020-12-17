#!/bin/bash

set -eu

mkdir -p lib/src/msgs/
cp ../../devel/share/gendart/ros/test_dart/lib/msgs.dart lib/
cp ../../devel/share/gendart/ros/test_dart/lib/src/msgs/*.dart lib/src/msgs/

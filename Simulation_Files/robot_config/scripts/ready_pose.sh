#!/usr/bin/env bash
set -e

source /opt/ros/jazzy/setup.bash
source ~/spray_ws/install/setup.bash

echo "Waiting for joint_trajectory_controller..."

until ros2 control list_controllers 2>/dev/null | grep -E 'joint_trajectory_controller[[:space:]]+joint_trajectory_controller/JointTrajectoryController[[:space:]]+active' >/dev/null; do
    sleep 1
done

echo "Controller is active. Sending ready pose..."

ros2 topic pub --once \
  /joint_trajectory_controller/joint_trajectory \
  trajectory_msgs/msg/JointTrajectory \
  "{joint_names: [shoulder_pan_joint, shoulder_lift_joint, elbow_joint, wrist_1_joint, wrist_2_joint, wrist_3_joint], points: [{positions: [0.15, -1.5708, 1.4835, -2.4435, -1.5708, 1.5708], time_from_start: {sec: 5}}]}"

echo "Ready pose command sent."

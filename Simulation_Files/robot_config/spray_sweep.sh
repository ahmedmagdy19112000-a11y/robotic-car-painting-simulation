#!/usr/bin/env bash

source /opt/ros/jazzy/setup.bash
source ~/spray_ws/install/setup.bash

STATE_FILE="$HOME/spray_ws/robot_config/scripts/spray_state"
TRAJECTORY_TOPIC="/joint_trajectory_controller/joint_trajectory"

move_shoulder() {
    local target="$1"

    ros2 topic pub --once "$TRAJECTORY_TOPIC" \
        trajectory_msgs/msg/JointTrajectory \
        "{joint_names: [shoulder_pan_joint, shoulder_lift_joint, elbow_joint, wrist_1_joint, wrist_2_joint, wrist_3_joint], points: [{positions: [$target, -1.5708, 1.4835, -2.4435, -1.5708, 1.5708], time_from_start: {sec: 2}}]}" \
        >/dev/null
}

stop_sweep() {
    echo "Sweep stopped."
    exit 0
}

trap stop_sweep INT TERM

echo "Waiting for spray control..."

while true; do
    if [[ ! -f "$STATE_FILE" ]] || [[ "$(cat "$STATE_FILE")" != "on" ]]; then
        sleep 0.2
        continue
    fi

    move_shoulder 0.40
    sleep 2

    [[ "$(cat "$STATE_FILE")" == "on" ]] || continue

    move_shoulder -0.10
    sleep 2
done

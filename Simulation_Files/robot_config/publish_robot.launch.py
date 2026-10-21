from launch import LaunchDescription
from launch.actions import TimerAction, ExecuteProcess
from launch_ros.actions import Node
from launch.substitutions import Command
from launch_ros.parameter_descriptions import ParameterValue
from pathlib import Path


def generate_launch_description():
    home = Path.home()

    urdf = str(home / "spray_ws/robot_config/ur5e_spray.urdf")
    ready_script = str(home / "spray_ws/robot_config/scripts/ready_pose.sh")

    robot_state_publisher = Node(
        package="robot_state_publisher",
        executable="robot_state_publisher",
        name="robot_state_publisher",
        output="screen",
        parameters=[
            {
                "robot_description": ParameterValue(
                    Command(["cat ", urdf]),
                    value_type=str
                ),
                "use_sim_time": True,
            }
        ],
    )

    ready_pose = TimerAction(
        period=5.0,
        actions=[
            ExecuteProcess(
                cmd=["bash", ready_script],
                output="screen",
            )
        ],
    )

    return LaunchDescription([
        robot_state_publisher,
        ready_pose,
    ])

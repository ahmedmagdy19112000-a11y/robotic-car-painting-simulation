# Robotic Car Painting Cell Simulation

## Candidate Information
- Name: Ahmed Magdy
- College: Cairo New Technological University
- Simulation Software: ROS 2 Jazzy and Gazebo Harmonic
- Robot Selected: Universal Robots UR5e

## Project Overview
This project demonstrates a robotic car painting cell simulated using ROS 2 and Gazebo. The setup includes a vehicle, a UR5e robot equipped with a spray gun, a simulation environment, and a spray-painting plugin.

## Project Structure
- `Simulation_Files/worlds/`: Gazebo world.
- `Simulation_Files/robot_config/`: Robot descriptions, launch files, and spray control scripts.
- `Simulation_Files/models/`: Vehicle and environment models.
- `Simulation_Files/plugin_source/`: Spray-painting plugin source code.

## Software Requirements
- Ubuntu Linux
- ROS 2 Jazzy
- Gazebo Harmonic (Gazebo Sim 8)
- ros2_control and gz_ros2_control
- CMake and ament_cmake

## Demonstrated Features
- Loading the painting cell in Gazebo.
- Loading the UR5e robot and spray gun.
- Activating the robot controllers.
- Repeated robot sweep motion.
- Enabling and disabling the spray system.

## Known Limitations
Some configuration files still use absolute paths from the development computer. These paths must be made portable before running the project on another computer.

Collision checking must be verified and documented before claiming that it is fully implemented.

## Third-Party Components
The spray-painting plugin source includes a LICENSE file. Review the applicable licenses for third-party models and assets before redistribution.

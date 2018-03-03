# AppDynamics License Count Report

Here is a utility to get a report on the license usage for AppDynamics Controllers. This is a java application from [AppDynamics](https://github.com/Appdynamics/AppDLicenseCount). Since it requires some specific java environment, I've put it in a docker container for easy portability.

## Usage
---
First, you'll need to update the controller.cfg file with the proper credentials to connect to our AppDynamics Controller. Examples have been provided.

Then, use docker to build the image from the Dockerfile.

`docker build -t name_it_something .`

You will need to run the container using persistent storage using the `-v` switch and map a directory to a local directory:

`docker run -i -v /path/to/docker/reports:/project/resource/reports container_name bash /project/resource/AppDCron.sh`

## To Do
---
- [ ] Add PowerShell script for running on windows servers as a scheduled task.

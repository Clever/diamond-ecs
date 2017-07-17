# diamond-ecs
Diamond container for collecting ecs disk space metrics and reporting them to influx and signalfx

## Environment Variables

  - **HOSTNAME** hostname of the ECS machine this container will run on
  - **ENVIRONMENT** cluster name/deployment environment
  - **GRAPHITE_HOST** hostname of the influx database
  - **GRAPHITE_PORT** port on the influx database where the graphite plugin is running
  - **SIGNALFX_TOKEN** token for writing to SignalFX

## Volumes

  - **/:/mnt/host_root:ro** This container needs access to the root drive to collect disk space information about it.

## Deploying

This is a container we would like to be deployed on all the ECS machines
so it is deployed via [https://github.com/Clever/ecs-ops](https://github.com/Clever/ecs-ops).

1. Make your changes and push to github. Circle will build an image for you.

2. Use [ecs-ops](https://github.com/clever/ecs-ops) to deploy your changes:
	```
	$ ./ecs-ops omni-start development diamond-ecs
	$ ./ecs-ops omni-start production diamond-ecs
	$ ./ecs-ops omni-start website diamond-ecs
	```

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


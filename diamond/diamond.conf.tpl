################################################################################
# Diamond Configuration File
################################################################################

################################################################################
### Options for the server
[server]

# Handlers for published metrics.
handlers = diamond.handler.signalfx.SignalfxHandler, diamond.handler.graphite.GraphiteHandler

# User diamond will run as
# Leave empty to use the current user
user = 

# Group diamond will run as
# Leave empty to use the current group
group = nogroup

# Pid file
pid_file = /var/run/diamond.pid

# Directory to load collector modules from
collectors_path = /usr/local/share/diamond/collectors/

# Directory to load collector configs from
collectors_config_path = /etc/diamond/collectors/

# Directory to load handler configs from
handlers_config_path = /etc/diamond/handlers/

# Interval to reload collectors
collectors_reload_interval = 3600

################################################################################
### Options for handlers
[handlers]

# daemon logging handler(s)
keys = stdout

### Defaults options for all Handlers
[[default]]

[[ArchiveHandler]]

# File to write archive log files
log_file = /var/log/diamond/archive.log

# Number of days to keep archive log files
days = 7


[[GraphiteHandler]]
### Options for GraphiteHandler

# Graphite server host
host = {{ GRAPHITE_HOST }}

# Port to send metrics to
port = {{ GRAPHITE_PORT }}

# Socket timeout (seconds)
timeout = 15

# Batch size for metrics
batch = 1

[[SignalfxHandler]]
auth_token = {{ SIGNALFX_TOKEN }}
batch_size = 1



################################################################################
### Options for collectors
[collectors]

[[default]]
### Defaults options for all Collectors

# Uncomment and set to hardcode a hostname for the collector path
# Keep in mind, periods are seperators in graphite
hostname = servers.{{ HOSTNAME }}


# Path Prefix and Suffix
# you can use one or both to craft the path where you want to put metrics
# such as: %(path_prefix)s.$(hostname)s.$(path_suffix)s.$(metric)s
path_prefix = {{ ENVIRONMENT }}
# path_suffix =

# Default Poll Interval (seconds)
interval = 60
enabled = False



################################################################################
### Options for logging
# for more information on file format syntax:
# http://docs.python.org/library/logging.config.html#configuration-file-format


[loggers]
keys = root

# handlers are higher in this config file, in:
# [handlers]
# keys = ...

[formatters]
keys = stdout

[logger_root]
# to increase verbosity, set DEBUG
level = DEBUG
handlers = stdout

[handler_stdout]
class = StreamHandler
level = DEBUG
formatter = stdout
args = (sys.stdout,)

[formatter_stdout]
format = %(asctime)-15s diamond[%(process)d] %(message)s
datefmt = %b %d %H:%M:%S


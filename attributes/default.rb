set[:newrelic][:dir] = "/etc/newrelic"

# Anything else will completely remove newrelic from the system
default[:newrelic][:action] = "install"

# 40-character hexadecimal string provided by New Relic. This is
# required in order for the server monitor to start.
default[:newrelic][:license_key] = ""
#
# Level of detail you want in the log file (as defined by the logfile
# setting below. Valid values are (in increasing levels of verbosity):
#  error        - show errors only
#  warning      - show errors and warnings
#  info         - show minimal additional information messages
#  verbose      - show more detailed information messages
#  debug        - show debug messages
#  verbosedebug - show very detailed debug messages
default[:newrelic][:loglevel] = "info"
#
# Name of the file where the server monitor will store it's log
# messages. The amount of detail stored in this file is controlled by
# the loglevel option (above).
default[:newrelic][:logfile] = "/var/log/newrelic/nrsysmond.log"
#
# The name and optional login credentials of the proxy server to use
# for all communication with the New Relic collector. In its simplest
# form this setting is just a hostname[:port] setting. The default
# port if none is specified is 1080. If your proxy requires a user
# name, use the syntax user@host[:port]. If it also requires a
# password use the format user:password@host[:port]. For example:
#   fred:secret@proxy.mydomain.com:8181
#
default[:newrelic][:proxy] = ""
#
# Whether or not to use the Secure Sockets Layer (SSL) for all
# communication with the New Relic collector. Possible values are
# true/on or false/off. In certain rare cases you may need to modify
# the SSL certificates settings below.
default[:newrelic][:ssl] = "false"
#
# The name of the New Relic collector to connect to. This should only
# ever be changed on advise from a New Relic support staff member.
# The format is host[:port]. Using a port number of 0 means the default
# port, which is 80 (if not using the ssl option - see below) or 443
# if SSL is enabled. If the port is omitted the default value is used.
default[:newrelic][:collector] = "collector.newrelic.com"
#
# How long the monitor should wait to contact the collector host. If
# the connection cannot be established in this period of time, the
# monitor will progressively back off in 15-second increments, up to
# a maximum of 300 seconds. Once the initial connection has been
# established, this value is reset back to the value specified here
# (or the default). This then sets the maximum time to wait for
# a connection to the collector to report data. There is no back-off
# once the original connection has been made. The value is in seconds.
default[:newrelic][:collector_timeout] = 30

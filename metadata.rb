maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Installs and configures newrelic"
version           "0.1.0"

recipe "newrelic", "Installs and configures newrelic sysmond"

supports "ubuntu"
supports "debian"

depends "apt" # https://github.com/gchef/apt-cookbook

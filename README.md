# Syncthing Relay Docker Image 

[![Build Status](https://travis-ci.org/derenderkeks/docker-syncthing-relay.svg)](https://travis-ci.org/derenderkeks/docker-syncthing-relay)
[![Docker Stars](https://img.shields.io/docker/stars/derenderkeks/syncthing-relay.svg)](https://hub.docker.com/r/derenderkeks/syncthing-relay/)
[![Docker Pulls](https://img.shields.io/docker/pulls/derenderkeks/syncthing-relay.svg)](https://hub.docker.com/r/derenderkeks/syncthing-relay/)
[![ImageLayers](https://images.microbadger.com/badges/image/derenderkeks/syncthing-relay.svg)](https://microbadger.com/#/images/derenderkeks/syncthing-relay)

## Overview
Syncthing Relay to help Syncthing clients relay data when they can't communicate directly due to things like NAT routers and firewalls blocking inbound TCP connections.

More detailed description on [this blog](https://blog.kylemanna.com/sharing/syncthing-relay-docker-container/).

Extensively tested on Digital Ocean $5/mo node

## Upstream Links

* Docker Registry @ [derenderkeks/syncthing-relay](https://hub.docker.com/r/derenderkeks/syncthing-relay/)
* GitHub @ [derenderkeks/docker-syncthing-relay](https://github.com/derenderkeks/docker-syncthing-relay)

## Quick Start

Just run:

    docker run --rm -p 22067:22067 -p 22070:22070 derenderkeks/syncthing-relay

Verify your server shows up at http://relays.syncthing.net/

## Using Systemd to Auto Start the Docker Container

Here's the quick start guide for setting up a systemd service that will listen on the defualt ports and start at boot time.  It will also attempt to pull down image updates each time the service starts and automatically restart after 10 seconds if the process exits.  This Docker container preserves no state across starts.

```
cd /etc/systemd/system
sudo curl -O https://raw.githubusercontent.com/derenderkeks/docker-syncthing-relay/master/init/docker-syncthing-relay.service
sudo systemctl daemon-reload
sudo systemctl start docker-syncthing-relay.service
sudo systemctl status docker-syncthing-relay.service
sudo systemctl enable docker-syncthing-relay.service
```

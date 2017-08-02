# PiWIDS - A simple RaspberryPI based  WiFI Intrusion Detection System (WIDS)

This SaltStack formula installs PiWIDS

## Requirements

  * Probes: RaspberryPI with an external USB WIFI that supports monitor mode (We use Alpha Networks)
  * Console: ELKS server

## Profiles

These are the available profiles to apply

  * probe: Setup a probe system (RaspberryPI)

### TODO

Things to be done:

  * Change kismet to run as non-root
  * Ship logs to Wazuh/ELKS
  * Ship data files to central server
  * Rotate files
  * Maybe: Analyze capture pcap file to detect anomalies and recomendations (air time, etc)

  * Document alert types

Kismet config:

  * Select the alerts to activate in the pillar

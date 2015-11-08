InfluxDB
========
[![Latest Version](http://img.shields.io/github/release/mtchavez/ansible-influxdb.svg?style=flat-square)](https://github.com/mtchavez/ansible-influxdb/releases)
[![Build Status](https://travis-ci.org/mtchavez/ansible-influxdb.svg?branch=master)](https://travis-ci.org/mtchavez/ansible-influxdb)

InfluxDB Ansible Galaxy role. Sets up a working InfluxDB server. This role is for versions of InfluxDB >= `0.9.3` and is currently defaulted to `0.9.4.2`.

Requirements
------------

Ansible version 1.6 and greater

Role Variables
--------------

Variables are mostly what exists in the InfluxDB config file. Which you can see [here](http://influxdb.com/docs/v0.7/advanced_topics/configuration_options.html)

**Currenlty clustering is not taken into account for.**

Dependencies
------------

No current dependencies on other Galaxy roles.

Example Playbook
-------------------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - influxdb
License
-------

BSD

Author Information
------------------

El Chavo - mtchavez - 2014

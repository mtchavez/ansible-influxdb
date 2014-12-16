InfluxDB
========
[![Latest Version](http://img.shields.io/github/release/mtchavez/ansible-influxdb.svg?style=flat-square)](https://github.com/mtchavez/ansible-influxdb/releases)
[![Build Status](https://travis-ci.org/mtchavez/ansible-influxdb.svg?branch=master)](https://travis-ci.org/mtchavez/ansible-influxdb)

InfluxDB Ansible Galaxy role. Sets up a working InfluxDB server

Requirements
------------

Ansible version 1.6 and greater

Role Variables
--------------

Variables are mostly what exists in the InfluxDB config file. Which you can see [here](http://influxdb.com/docs/v0.7/advanced_topics/configuration_options.html)

The `influxdb.hostname` variable may need to be set to something other than `ansible_default_ipv4.address` so make
sure your setup takes this into account. Using EC2 you may need to gather facts first and use `ansible_ec2_public_hostname`
if public facing.

Currenlty clustering is not taken into account for. This will be a `TODO` at a later date.

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

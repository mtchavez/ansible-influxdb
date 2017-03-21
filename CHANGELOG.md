# v6.0.0 - 2017-03-20

* Major update of role to InfluxDB `1.2.0` - thanks to [popstas](https://github.com/popstas)

# v5.0.0 - 2016-04-05

* Test Kitchen setup and integration
* Updates to role for open source role conventions
* Collectd setup when enabled
* UDP read buffer configurable
* Update to InfluxDB 11.x and configuration >= 10.x (backwards incompatible changes)

# v4.0.0 – 2016-01-02

* Use `defaults/main.yml` for variables
* Upgrade role for changes introduced in `0.9.5` with updated directories
* Breaking changes for versions before `0.9.5` due to directory updates

# v3.0.1 – 2015-11-11

* Fix config merging
* Default collectd variables

# v3.0.1 – 2015-11-09

* Create influxdb user and group
* Create wal directory

# v3.0 – 2015-11-07

* Update influxdb to 0.9.4.2
* Update config to be valid for versions >= 0.9.3

# v2.1.0 – 2015-08-03

* Bump influxdb version to 0.9.2

# v2.0.4 – 2014-10-15

* Fix iptables graphite to use dport not dports

# v2.0.3 – 2014-10-02

* Expose graphite port to iptables

# v2.0 – 2014-10-01

* Fix variable naming to be underscore delimited
* Add wal variables

# v1.0 – 2014-10-01

* Initial implementation for version 0.8.3

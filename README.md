InfluxDB
========
[![Latest Version](http://img.shields.io/github/release/mtchavez/ansible-influxdb.svg?style=flat-square)](https://github.com/mtchavez/ansible-influxdb/releases)
[![Build Status](https://travis-ci.org/mtchavez/ansible-influxdb.svg?branch=master)](https://travis-ci.org/mtchavez/ansible-influxdb)

InfluxDB Ansible Galaxy role. Sets up a working InfluxDB server.
This role is for versions of InfluxDB >= `0.9.6` and is currently defaulted to `0.9.6`.

**Currenlty clustering is not taken into account for.**

Requirements
------------

Ansible version 1.6 and greater

Role Variables
--------------

Variables are mostly what exists in the InfluxDB config file. Which you can see [here](https://raw.githubusercontent.com/influxdb/influxdb/master/etc/config.sample.toml)

```
#
# Config
#
influxdb_config_dir: "/etc/opt/influxdb"
influxdb_config_file: "{{influxdb_config_dir}}/influxdb.conf"
influxdb_generated_config: "{{influxdb_config_dir}}/influxdb.generated.conf"
influxdb_reporting_disabled: "false"

# [meta]
influxdb_meta_dir: "/var/opt/influxdb/meta"
influxdb_hostname: "localhost"
influxdb_bind_address: ":8088"
influxdb_retention_autocreate: "true"
influxdb_election_timeout: "1s"
influxdb_heartbeat_timeout: "1s"
influxdb_leader_lease_timeout: "500ms"
influxdb_commit_timeout: "50ms"

# [data]
influxdb_data_dir: "/var/opt/influxdb/data"
influxdb_data_engine: "bz1"
influxdb_max_wal_size: 104857600
influxdb_wal_flush_interval: "10m"
influxdb_wal_partition_flush_delay: "2s"
influxdb_wal_dir: "/var/opt/influxdb/wal"
influxdb_wal_enable_logging: "true"
influxdb_wal_ready_series_size: 25600
influxdb_wal_compaction_threshold: 0.6
influxdb_wal_max_series_size: 2097152
influxdb_wal_flush_cold_interval: "10m"
influxdb_wal_partition_size_threshold: 20971520
influxdb_query_log_enabled: "false"

# [hinted-handoff]
influxdb_hh_enabled: "true"
influxdb_hh_dir: "/var/opt/influxdb/hh"
influxdb_hh_max_size: 1073741824
influxdb_hh_max_age: "168h"
influxdb_hh_retry_rate_limit: 0
influxdb_hh_retry_interval: "1s"
influxdb_hh_retry_max_interval: "1m"
influxdb_hh_purge_interval: "1h"

# [cluster]
influxdb_cluster_shard_writer_timeout: "10s"
influxdb_cluster_write_timeout: "5s"

# [retention]
influxdb_retention_enabled: "true"
influxdb_retention_check_interval: "30m"

# [shard-precreation]
influxdb_shard_creation_enabled: "true"
influxdb_shard_creation_check_interval: "10m"
influxdb_shard_creation_advance_period: "30m"

# [monitor]
influxdb_monitor_store_enabled: "true"
influxdb_monitor_store_database: "_internal"
influxdb_monitor_store_interval: "10s"

# [admin]
influxdb_admin_enabled: "true"
influxdb_admin_bind_address: ":8083"
influxdb_admin_https_enabled: "false"
influxdb_admin_https_certificate: "/etc/ssl/influxdb.pem"

# [http]
influxdb_http_enabled: "true"
influxdb_http_bind_address: ":8086"
influxdb_http_auth_enabled: "false"
influxdb_http_log_enabled: "true"
influxdb_http_write_tracing: "false"
influxdb_http_pprof_enabled: "false"
influxdb_http_https_enabled: "false"
influxdb_http_https_certificate: "/etc/ssl/influxdb.pem"

# [[graphite]]
influxdb_graphite_enabled: "false"
influxdb_graphite_database: "graphite"
influxdb_graphite_bind_address: ":2003"
influxdb_graphite_protocol: "tcp"
influxdb_graphite_consistency_level: "one"
influxdb_graphite_name_separator: "."
influxdb_graphite_batch_size: 1000
influxdb_graphite_batch_pending: 5
influxdb_graphite_batch_timeout: "1s"
influxdb_graphite_name_schema: "type.host.measurement.device"
influxdb_graphite_ignore_unnamed: "false"

# [collectd]
influxdb_collectd_enabled: "false"
influxdb_collectd_bind_address: ""
influxdb_collectd_database: ""
influxdb_collectd_typesdb: ""
influxdb_collectd_batch_size: 1000
influxdb_collectd_batch_pending: 5
influxdb_collectd_batch_timeout: "1s"

# [opentsdb]
influxdb_tsb_enabled: "false"
influxdb_tsb_bind_address: ":4242"
influxdb_tsb_database: "opentsdb"
influxdb_tsb_retention_policy: ""
influxdb_tsb_consistency_level: "one"
influxdb_tsb_tls_enabled: "false"
influxdb_tsb_certificate: ""
influxdb_tsb_batch_size: 1000
influxdb_tsb_batch_pending: 5
influxdb_tsb_batch_timeout: "1s"

# [[udp]]
influxdb_udp_enabled: "false"
influxdb_udp_bind_address: ""
influxdb_udp_database: "udp"
influxdb_udp_retention_policy: ""
influxdb_udp_batch_size: 1000
influxdb_udp_batch_pending: 5
influxdb_udp_batch_timeout: "1s"

# [continuous_queries]
influxdb_cqueries_log_enabled: "true"
influxdb_cqueries_enabled: "true"
influxdb_cqueries_recompute_previous_n: 2
influxdb_cqueries_recompute_no_older_than: "10m"
influxdb_cqueries_compute_runs_per_interval: 10
influxdb_cqueries_compute_no_more_than: "2m"
```

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

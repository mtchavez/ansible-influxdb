# InfluxDB
[![Latest Version](http://img.shields.io/github/release/mtchavez/ansible-influxdb.svg?style=flat-square)](https://github.com/mtchavez/ansible-influxdb/releases)
[![Build Status](https://travis-ci.org/mtchavez/ansible-influxdb.svg?branch=master)](https://travis-ci.org/mtchavez/ansible-influxdb)

InfluxDB Ansible Galaxy role. Sets up a working InfluxDB server.
This role is for versions of InfluxDB >= `0.11.1` and is currently defaulted to `0.11.1.1`.

**Currenlty clustering is not taken into account for.**

## Requirements

Ansible version 1.6 and greater

## Role Variables

Variables are mostly what exists in the InfluxDB config file. Which you can see [here](https://raw.githubusercontent.com/influxdb/influxdb/master/etc/config.sample.toml)

```
influxdb_collectd_typesdb_url: "https://raw.githubusercontent.com/collectd/collectd/master/src/types.db"
influxdb_collectd_typesdb_directory: "/usr/share/collectd"

#
# Config
#
influxdb_config_dir: "/etc/influxdb"
influxdb_config_file: "{{ influxdb_config_dir }}/influxdb.conf"
influxdb_generated_config: "{{ influxdb_config_dir }}/influxdb.generated.conf"
influxdb_reporting_disabled: "false"
influxdb_base_data_dir: "/var/lib/influxdb"
influxdb_influxd_bin: "/usr/bin/influxd"
influxdb_scripts_dir: "/usr/lib/influxdb/scripts"

# [meta]
influxdb_meta_enabled: "true"
influxdb_meta_dir: "{{ influxdb_base_data_dir }}/meta"
influxdb_bind_address: ":8088"
influxdb_meta_http_bind_address: ":8091"
influxdb_retention_autocreate: "true"
influxdb_election_timeout: "1s"
influxdb_heartbeat_timeout: "1s"
influxdb_leader_lease_timeout: "500ms"
influxdb_commit_timeout: "50ms"
influxdb_meta_logging_enabled: "true"
influxdb_meta_pprof_enabled: "false"
influxdb_meta_lease_duration: "1m0s"

# [data]
influxdb_data_enabled: "true"
influxdb_data_dir: "{{ influxdb_base_data_dir }}/data"
influxdb_data_logging_enabled: "true"
influxdb_data_query_log_enabled: "true"
influxdb_data_cache_max_memory_size: 524288000
influxdb_data_cache_snapshot_memory_size: 26214400
influxdb_data_cache_snapshot_write_cold_duration: "1h"
influxdb_data_compact_min_file_count: 3
influxdb_data_compact_full_write_cold_duration: "24h"
influxdb_data_max_points_per_block: 1000
influxdb_wal_dir: "{{ influxdb_base_data_dir }}/wal"
influxdb_wal_logging_enabled: "true"

# [cluster]
influxdb_cluster_shard_writer_timeout: "10s"
influxdb_cluster_write_timeout: "5s"
influxdb_cluster_max_concurrent_queries: 0
influxdb_cluster_query_timeout: "0s"
influxdb_cluster_max_select_point: 0
influxdb_cluster_max_select_series: 0
influxdb_cluster_max_select_buckets: 0

# [hinted-handoff]
influxdb_hh_enabled: "false"
influxdb_hh_dir: "{{ influxdb_base_data_dir }}/hh"
influxdb_hh_max_size: 1073741824
influxdb_hh_max_age: "168h"
influxdb_hh_retry_rate_limit: 0
influxdb_hh_retry_interval: "1s"
influxdb_hh_retry_max_interval: "1m"
influxdb_hh_purge_interval: "1h"

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
influxdb_graphite_separator: "."
influxdb_graphite_udp_read_buffer: 0
influxdb_graphite_batch_size: 1000
influxdb_graphite_batch_pending: 5
influxdb_graphite_batch_timeout: "1s"
influxdb_graphite_templates:
  - "type.host.measurement.device"

# [collectd]
influxdb_collectd_enabled: "false"
influxdb_collectd_bind_address: ":25826"
influxdb_collectd_database: "collectd"
influxdb_collectd_typesdb: "/usr/share/collectd/types.db"
influxdb_collectd_batch_size: 1000
influxdb_collectd_batch_pending: 5
influxdb_collectd_batch_timeout: "1s"
influxdb_collectd_read_buffer: 0

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
influxdb_tsb_log_point_errors: "true"

# [[udp]]
influxdb_udp_enabled: "false"
influxdb_udp_bind_address: ""
influxdb_udp_database: "udp"
influxdb_udp_retention_policy: ""
influxdb_udp_batch_size: 1000
influxdb_udp_batch_pending: 5
influxdb_udp_batch_timeout: "1s"
influxdb_udp_read_buffer: 0
influxdb_udp_payload_size: 65536

# [continuous_queries]
influxdb_cqueries_log_enabled: "true"
influxdb_cqueries_enabled: "true"
influxdb_cqueries_run_interval: "1s"
```

## Dependencies

No current dependencies on other Galaxy roles.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - influxdb
## License

BSD

## Author Information

El Chavo - mtchavez - 2014

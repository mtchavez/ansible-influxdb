# InfluxDB
[![Latest Version](http://img.shields.io/github/release/mtchavez/ansible-influxdb.svg?style=flat-square)](https://github.com/mtchavez/ansible-influxdb/releases)
[![Build Status](https://travis-ci.org/mtchavez/ansible-influxdb.svg?branch=master)](https://travis-ci.org/mtchavez/ansible-influxdb)

InfluxDB Ansible Galaxy role. Sets up a working InfluxDB server.
This role is for versions of InfluxDB >= `1.2.0` and is currently defaulted to `1.2.0`.

**Currenlty clustering is not taken into account for.**

## Requirements

Ansible version `>= 1.9`

## Role Variables

Variables are mostly what exists in the InfluxDB config file. Which you can see [here](https://raw.githubusercontent.com/influxdb/influxdb/master/etc/config.sample.toml)

```
influxdb_install_method: "repository" # or "download"

influxdb_collectd_typesdb_url: "https://raw.githubusercontent.com/collectd/collectd/master/src/types.db"
influxdb_collectd_typesdb_directory: "/usr/share/collectd"

#
# Config
#
influxdb_config_dir: "/etc/influxdb"
influxdb_config_file: "{{ influxdb_config_dir }}/influxdb.conf"
influxdb_generated_config: "{{ influxdb_config_dir }}/influxdb.generated.conf"
influxdb_reporting_disabled: "false"

# [meta]
influxdb_meta_dir: "{{ influxdb_base_data_dir }}/meta"
influxdb_retention_autocreate: "true"
influxdb_meta_logging_enabled: "true"

# [data]
influxdb_data_dir: "{{ influxdb_base_data_dir }}/data"
influxdb_wal_dir: "{{ influxdb_base_data_dir }}/wal"
influxdb_data_trace_logging_enabled: "false"
influxdb_data_query_log_enabled: "true"
influxdb_data_cache_max_memory_size: 1048576000
influxdb_data_cache_snapshot_memory_size: 26214400
influxdb_data_cache_snapshot_write_cold_duration: "10m"
influxdb_data_compact_full_write_cold_duration: "4h"
influxdb_data_max_series_per_database: 1000000
influxdb_data_max_values_per_tag: 100000

# [coordinator]
influxdb_coordinator_write_timeout: "10s"
influxdb_coordinator_max_concurrent_queries: 0
influxdb_coordinator_query_timeout: "0s"
influxdb_coordinator_log_queries_after: "0s"
influxdb_coordinator_max_select_point: 0
influxdb_coordinator_max_select_series: 0
influxdb_coordinator_max_select_buckets: 0

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
influxdb_admin_enabled: "false"
influxdb_admin_bind_address: ":8083"
influxdb_admin_https_enabled: "false"
influxdb_admin_https_certificate: "/etc/ssl/influxdb.pem"

# [http]
influxdb_http_enabled: "true"
influxdb_http_bind_address: ":8086"
influxdb_http_auth_enabled: "false"
influxdb_http_realm: "InfluxDB"
influxdb_http_log_enabled: "true"
influxdb_http_write_tracing: "false"
influxdb_http_pprof_enabled: "true"
influxdb_http_https_enabled: "false"
influxdb_http_https_certificate: "/etc/ssl/influxdb.pem"
influxdb_http_https_private_key: ""
influxdb_http_shared_sercret: ""
influxdb_http_max_row_limit: 10000
influxdb_http_max_connection_limit: 0
influxdb_http_unix_socket_enabled: "false"
influxdb_http_bind_socket: "/var/run/influxdb.sock"

# [subscriber]
influxdb_subscriber_enabled: "true"
influxdb_subscriber_http_timeout: "30s"
influxdb_subscriber_insecure_skip_verify: "false"
influxdb_subscriber_ca_certs: ""
influxdb_subscriber_write_concurrency: 40
influxdb_subscriber_write_buffer_size: 1000

# [[graphite]]
influxdb_graphite_enabled: "false"
influxdb_graphite_database: "graphite"
influxdb_graphite_retention_policy: ""
influxdb_graphite_bind_address: ":2003"
influxdb_graphite_protocol: "tcp"
influxdb_graphite_consistency_level: "one"
influxdb_graphite_batch_size: 5000
influxdb_graphite_batch_pending: 5
influxdb_graphite_batch_timeout: "1s"
influxdb_graphite_udp_read_buffer: 0
influxdb_graphite_separator: "."
#influxdb_graphite_tags: [ "region=us-east", "zone=1c" ]
influxdb_graphite_templates:
  - "type.host.measurement.device"

# [[collectd]]
influxdb_collectd_enabled: "false"
influxdb_collectd_bind_address: ":25826"
influxdb_collectd_database: "collectd"
influxdb_collectd_retention_policy: ""
influxdb_collectd_typesdb: "/usr/share/collectd/types.db"
influxdb_collectd_security_level: "none"
influxdb_collectd_auth_file: "/etc/collectd/auth_file"
influxdb_collectd_batch_size: 5000
influxdb_collectd_batch_pending: 10
influxdb_collectd_batch_timeout: "10s"
influxdb_collectd_read_buffer: 0

# [[opentsdb]]
influxdb_tsb_enabled: "false"
influxdb_tsb_bind_address: ":4242"
influxdb_tsb_database: "opentsdb"
influxdb_tsb_retention_policy: ""
influxdb_tsb_consistency_level: "one"
influxdb_tsb_tls_enabled: "false"
influxdb_tsb_certificate: "/etc/ssl/influxdb.pem"
influxdb_tsb_log_point_errors: "true"
influxdb_tsb_batch_size: 1000
influxdb_tsb_batch_pending: 5
influxdb_tsb_batch_timeout: "1s"

# [[udp]]
influxdb_udp_enabled: "false"
influxdb_udp_bind_address: ":8089"
influxdb_udp_database: "udp"
influxdb_udp_retention_policy: ""
influxdb_udp_batch_size: 5000
influxdb_udp_batch_pending: 10
influxdb_udp_batch_timeout: "1s"
influxdb_udp_read_buffer: 0

# [continuous_queries]
influxdb_cqueries_enabled: "true"
influxdb_cqueries_log_enabled: "true"
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

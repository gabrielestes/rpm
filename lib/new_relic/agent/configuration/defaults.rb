module NewRelic
  module Agent
    module Configuration
      DEFAULTS = {
        'config_path' => File.join('config', 'newrelic.yml'),

        'agent_enabled'  => true,
        'enabled'        => Proc.new { self['agent_enabled'] },
        'monitor_mode'   => Proc.new { self['agent_enabled'] },
        'developer_mode' => Proc.new { self['developer'] },
        'developer'      => false,
        'apdex_t'        => 0.5,

        'host'               => 'collector.newrelic.com',
        'ssl'                => false,
        'verify_certificate' => false,
        'sync_startup'       => false,
        'send_data_on_exit'  => true,
        'post_size_limit'    => 2 * 1024 * 1024,

        'log_file_path' => 'log/',
        'log_level'     => 'info',

        'disable_samplers'                     => false,
        'disable_resque'                       => false,
        'disable_dj'                           => false,
        'disable_view_instrumentation'         => false,
        'disable_backtrace_cleanup'            => false,
        'disable_activerecord_instrumentation' => false,
        'disable_memcache_instrumentation'     => false,
        'disable_mobile_headers'               => true,

        'capture_memcache_keys' => false,
        'multi_threaded'        => false,
        'textmate'              => false,

        'transaction_tracer.enabled'               => true,
        'transaction_tracer.transaction_threshold' => Proc.new { self['apdex_t'] * 4 },
        'transaction_tracer.stack_trace_threshold' => 0.5,
        'transaction_tracer.explain_threshold'     => 0.5,
        'transaction_tracer.explain_enabled'       => true,
        'transaction_tracer.record_sql'            => 'obfuscated',
        'transaction_tracer.limit_segments'        => 4000,
        'transaction_tracer.random_sample'         => false,

        'slow_sql.enabled'               => Proc.new { self['transaction_tracer.enabled'] },
        'slow_sql.stack_trace_threshold' => Proc.new { self['transaction_tracer.stack_trace_threshold'] },
        'slow_sql.explain_threshold'     => Proc.new { self['transaction_tracer.explain_threshold'] },
        'slow_sql.explain_enabled'       => Proc.new { self['transaction_tracer.explain_enabled'] },
        'slow_sql.record_sql'            => Proc.new { self['transaction_tracer.record_sql'] },

        'error_collector.enabled'        => true,
        'error_collector.capture_source' => true,
        'error_collector.ignore_errors'  => 'ActionController::RoutingError',
      }.freeze
    end
  end
end
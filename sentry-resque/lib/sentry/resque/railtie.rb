# frozen_string_literal: true

module Sentry
  module Resque
    class Railtie < ::Rails::Railtie
      config.after_initialize do
        next unless Sentry.initialized? && defined?(::Sentry::Rails)
        next if Sentry.configuration.resque.active_job_integration == :rails

        Sentry.configuration.rails.skippable_job_adapters << JobExtension::ACTIVE_JOB_ADAPTER
      end
    end
  end
end

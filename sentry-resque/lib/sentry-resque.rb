# frozen_string_literal: true

require "resque"
require "sentry-ruby"
require "sentry/integrable"
require "sentry/resque/configuration"
require "sentry/resque/version"
require "sentry/resque/job_extension"
require "sentry/resque"

module Sentry
  module Resque
    extend Sentry::Integrable

    register_integration name: "resque", version: Sentry::Resque::VERSION

    def self.job_extension
      @job_extension ||= JobExtension.new
    end

    Sentry.register_job_extension(job_extension)
  end
end

require "sentry/resque/railtie" if defined?(::Rails::Railtie)

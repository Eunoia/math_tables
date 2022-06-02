# frozen_string_literal: true

module USGS
  class Hydrology
    extend Logging

    def initialize(huic)
      @huic = huic
    end

    def self.call
      logger.warn('as class method from Hydrology')
    end
  end
end

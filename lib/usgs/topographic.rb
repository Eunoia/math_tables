# frozen_string_literal: true

module USGS
  class Topographic
    include Logging
    def initialize(quad)
      @quad = quad
    end

    def call
      logger.warn('as instance from topo')
    end
  end
end

# frozen_string_literal: true

require 'pry'
# require_relative '../lib/usgs/topographic.rb'
require 'zeitwerk'
# ActiveSupport::Dependencies.autoload_paths

loader = Zeitwerk::Loader.new
loader.push_dir('./lib')
loader.inflector.inflect 'usgs' => 'USGS'

loader.setup # ready!

describe USGS::Topographic do
  describe '.logger' do
    it 'exists' do
      # logger = double("logger")
      # logger.stub(:log)
      t = USGS::Topographic.new('2c4')
      t.call

      # expect(t).to respond_to(:logger)
    end
  end
end

describe USGS::Hydrology do
  describe '::call' do
    it 'runs' do
      # t = USGS::Hydrology.new("2c4")
      USGS::Hydrology.call
    end
  end
end

describe Logging do
  describe '.logger' do
    it 'can be called when forced into method' do
      # logger = double("logger")
      # logger.stub(:log)
      class FakeService
        def invoke(str)
          logger.warn(str)
        end
      end
      fs = FakeService.new
      fs.send(:extend, Logging)
      fs.invoke('idk')

      # expect(t).to respond_to(:logger)
    end
  end
end

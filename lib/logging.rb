require 'logger'

module Logging
  def logger
    @classname = respond_to?(:new) ? name : self.class.name
    @logger ||= Logging.logger_for(@classname)
  end

  def logger=(logger)
    @logger = logger
  end

  @loggers = {}
  def self.logger_for(classname)
    @loggers[classname] ||= configure_logger_for(classname)
  end

  def self.configure_logger_for(classname)
    logger = Logger.new($stdout)
    logger.progname = classname
    logger
  end
end

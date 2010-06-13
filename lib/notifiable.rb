module Notifiable

  def self.setup
    yield self
  end

end

require 'notifiable/rails'
require 'notifiable/version'
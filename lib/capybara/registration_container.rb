# frozen_string_literal: true

module Capybara
  # @api private
  class RegistrationContainer

    def [](name)
      @registered[name]
    end

    def []=(name, value)
      warn "DEPRECATED: Directly setting drivers/servers is deprecated, please use Capybara.register_driver/register_server instead"
      @registered[name] = value
    end
    
    def method_missing(m, *args, **options, &block)
      warn "DEPRECATED: Calling '#{m}' on the drivers/servers container is deprecated without replacement"
      @registered.public_send(m, *args, **options, &block)
    end

  private
    
    def initialize
      @registered = {}
    end
    
    def register(name, block)
      @registered[name] = block
    end
  end
end
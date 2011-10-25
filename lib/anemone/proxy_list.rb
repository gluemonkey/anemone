module Anemone
  class ProxyList
    attr_accessor :host, :port
    #
    # Create a new ProxyList
    #
    def initialize(proxy_queue)
      @proxy_queue = proxy_queue
      @current_proxy_index = 0
      self.get_next
    end

    #
    # Returns the next proxy from the @proxy_queue
    #
    def get_next
      @current_proxy_index = Random.new.rand(0...(@proxy_queue.length-1))
      @current_proxy = @proxy_queue[@current_proxy_index].split(':')
    end
    
    def host
      return @current_proxy[0]
    end
    
    def port
      return @current_proxy[1]
    end

    private

    def mark_current_dead
      @proxy_queue.delete_at(@current_proxy_index)
    end

  end
end

require 'thread'

class Proco
module Queue
# @private
class SingleQueue < Proco::Queue::Base
  def initialize size
    super
  end

  def push_impl item
    future = Future.new
    tuples = [future, item]
    @items << tuples
    future
  end

  def take_impl
    @items.shift
  end
end
end
end


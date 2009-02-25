require 'ostruct'

class MockRecord
  def initialize
    @data       = OpenStruct.new
    @new_record = true
    @dirty      = false
  end
  
  def method_missing(id, *a)
    @dirty = true
    @data.send(id, *a)
  end
  
  def new_record?
    @new_record
  end
  
  def dirty?
    @dirty
  end
  
  def save!
    @new_record = false
    @dirty      = false
  end
  alias_method :save, :save!
end

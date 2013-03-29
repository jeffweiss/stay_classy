module StayClassy::Extensions::String
  def self.apply(subclass, super_class)
    puts "I'm an extension that can do something to make #{subclass} more like #{super_class}"
  end
end

module Kernel
  def stay_classy(klass)
    anon_subclass = Class.new(klass)
    require 'stay_classy'
    StayClassy.load_extensions(anon_subclass, klass)
    if block_given?
      yield anon_subclass
     else
       anon_subclass
     end

  end
end

module StayClassy
  def self.superclasses(klass)
    superclass = klass.superclass
    superclass ? [superclass] + (superclasses(superclass)) : []
  end

  def self.load_extensions(subklass, original_klass)
    require 'stay_classy/extensions'
    superclasses(original_klass).each do |super_class|
      begin
        extension = underscorize(super_class.name)
        require "stay_classy/extensions/#{extension}"
        StayClassy::Extensions.const_get(super_class.name).apply(subklass, original_klass)
      rescue LoadError
      end
    end
  end

  def self.underscorize(str)
    str.downcase.gsub('::', '_')
  end
end

require "pp"
puts "pp loaded"

begin
  require 'what_methods'
  puts "what_methods loaded"
rescue LoadError
  puts "missing what_methods"
end

begin
  require 'wirble'
  Wirble.init(:history_size => 5000)
  Wirble.colorize
  puts "wirble loaded"
rescue LoadError
  puts "missing wirble"
end

begin
  require "hirb"
  Hirb.enable
  puts "hirb loaded"
rescue LoadError
  puts "missing hirb"
end

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

# require 'irb/ext/save-history'
# puts "save-history loaded"
# IRB.conf[:SAVE_HISTORY] = 1000
# IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

puts ".irbrc successfully loaded"

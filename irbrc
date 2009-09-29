require 'what_methods'
require 'wirble'


IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"


Wirble.init
Wirble.colorize

puts ".irbrc successfully loaded"

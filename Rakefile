require "rake"

@home = File.expand_path(ENV['HOME'])

desc "Link files into home directory"
task :link do
  Dir['*'].each do |f|
    next if ['Rakefile', 'backup.sh'].include?(f)
      source = File.join(File.dirname(__FILE__), f)
      dest = File.join(@home, ".#{f}")
      link_file(source, dest)
  end
end

def link_file(source, dest)
  p "ln -s #{source} #{dest}"
#  system "ln -s #{f} #{destfile}"
end
function! PreviewMKD()
ruby << EOF
	require 'rubygems'
  require 'bluecloth'
  t = ""
  VIM::Buffer.current.count.times {|i| t += "#{VIM::Buffer.current[i + 1]}\n"}
  html_file = VIM::Buffer.current.name.gsub(/.(md|mkd)$/, '.html')
  if html_file == VIM::Buffer.current.name
    print "Error! - This file extension is not supported for Markdown previews"
  end
  File.open(html_file, 'w') do |f|
    f.write(BlueCloth.new(t).to_html)
  end
  system("open #{html_file}")
EOF
endfunction

map <Leader>p :call PreviewMKD()<CR>

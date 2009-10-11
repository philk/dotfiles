" This doesn't work on Snow Leopard?
" no suitable image found
function! PreviewMKD()
ruby << EOF
  require 'bluecloth'
  t = ""
  VIM::Buffer.current.count.times {|i| t += "#{VIM::Buffer.current[i + 1]}\n"}
  html_file = VIM::Buffer.current.name.gsub(/.(md|mkd|markdown)$/, '.html')
  puts html_file
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

" My custom functions!
function! MarkdownHeader(headerstring)
ruby << RUBYEOF
  headerstring = VIM::evaluate("a:headerstring")
  if headerstring.is_a?(String)
    @buffer = VIM::Buffer.current
    puts @buffer.line_number
    @buffer.append(@buffer.line_number.to_i, headerstring * @buffer.line.length.to_i)
  else
  end
RUBYEOF
endfunction

map <Leader>- :call MarkdownHeader("-")<CR><CR>
map <Leader>= :call MarkdownHeader("=")<CR><CR>
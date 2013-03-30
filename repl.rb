require 'readline'

puts "My Ruby REPL"

loop do
  input = Readline.readline(">> ", true)
  break if input.nil?
  input.chomp!
  begin
    result = eval(input)
    puts "#{input} => #{result}"
  rescue => error
    message = [error.message]
    message << error.backtrace.select do |v|
      v =~ /^[^\/]/
    end.map do |v|
      "        #{v}"
    end
    
    puts message.join "\n"
  end
end

puts

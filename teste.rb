require 'highline/import'

#cli = HighLine.new
answer = ask("What do you think?")
say("You have answered: #{answer}")


=begin
answer = cli.ask("Company?  ") { |q| q.default = "none" }
cli.say("This should be <%= color('#{answer}', BOLD) %>!")
puts "You have answered: #{answer}"
=end

cli.choose do |menu|
  menu.prompt = "Please choose your favorite programming language?  "
  menu.choice(:ruby) { cli.say("Good choice!") }
  menu.choices(:python, :perl) { cli.say("Not from around here, are you?") }
  menu.default = :ruby
end

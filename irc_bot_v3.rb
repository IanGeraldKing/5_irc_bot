require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "cynicbot"
channel = "#bitmaker"
salute = "PRIVMSG #{channel} :"

cynic = TCPSocket.open(server, port)

cynic.puts "USER cynicbot 0 * cynicbot"
cynic.puts "NICK #{nick}"
cynic.puts "JOIN #{channel}"
cynic.puts salute + "Are you happy today? Enter 'cynicbot: yes' or 'cynicbot: no'"

until cynic.eof? do

	response = cynic.gets.chomp.downcase
	puts response

	if response.include?("cynicbot: yes") || response.include?("cynicbot: no")

		regardless = "It doesn't matter how you feel - all that matters is what you do. Thus, do something important today."
		cynic.puts salute + "#{regardless}"
	end
end
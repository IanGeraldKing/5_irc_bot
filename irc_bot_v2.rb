require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "cynic_bot"
channel = "#bitmaker"
salute = "PRIVMSG #{channel} :"

userinput_collective = ["yes", "maybe", "no"]
userinput_happy = "yes"
userinput_sad = "no"

cynic = TCPSocket.open(server, port)

cynic.puts "USER cynicbot 0 * cynicbot"
cynic.puts "NICK #{nick}"
cynic.puts "JOIN #{channel}"
cynic.puts salute + "Are you happy today? Enter 'yes' or 'no'"

until cynic.eof? do
	response = cynic.gets.chomp.downcase
	puts response

	# if response.include?("no")
	if response =~ /privmsg\s+#bitmaker\s+\:yes/ || response =~ /privmsg\s+#bitmaker\s+\:no/
	# if response.include?("privmsg #bitmaker :yes") || response.include?("privmsg #bitmaker :no")
		regardless = "It doesn't matter how you feel - all that matters is what you do. Thus, do something important today."
		cynic.puts salute + "#{regardless}"
	end
end

#m privmsg #bitmaker :yes
#:hitchcock.freenode.net 421 cynicbot it :unknown command
	#if response.include? salute && userinput_happy
	#	cynic.puts "happy blah blah blah"
	#elsif response.include? salute && userinput_sad
	#	cynic.puts "sad blah blah blah"
	#sleep 20
	#end


=begin
until cynic.eof? do
	response = cynic.gets.chomp.downcase
	puts response
	
	user_responds = false
	userinput_collective.each { |u| user_responds = true if response.include? u }
end


if (response.include? userinput_happy) && user_responds
		#(salute && (user_responds = true) && userinput_happy)
	happy = "happy blah blah blah"
	cynic.puts salute + "#{happy}"
end

if response.include? userinput_sad && user_responds 
		#(salute && (user_responds = true) && userinput_sad)
	sad = "happy blah blah blah"
	cynic.puts salute + "#{sad}"
end
=end

# Asks if the anybody is happy (y/n).
# If yes, says a cynical quote,
# If not, tells them a cynical quote anyhow.

=begin
PRIVMSG
Syntax:
PRIVMSG <msgtarget> <message>
Sends <message> to <msgtarget>, which is usually a user or channel.

USER
Syntax:
USER <username> <hostname> <servername> <realname> (RFC 1459)
USER <user> <mode> <unused> <realname> (RFC 2812)
This command is used at the beginning of a connection to specify the username, hostname, real name and initial user modes of the connecting client. <realname> may contain spaces, and thus must be prefixed with a colon.
	
NICK
Syntax:
NICK <nickname> [<hopcount>] (RFC 1459)
NICK <nickname> (RFC 2812)
Allows a client to change their IRC nickname. Hopcount is for use between servers to specify how far away a nickname is from its home server.

JOIN
Syntax:
JOIN <channels> [<keys>]
Makes the client join the channels in the comma-separated list <channels>, specifying the passwords, if needed, in the comma-separated list <keys>.[11] If the channel(s) do not exist then they will be created.
Defined in RFC 1459
=end
#!/usr/bin/ruby

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    42stalker.rb                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jukim <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/09 19:05:39 by jukim             #+#    #+#              #
#    Updated: 2018/03/09 19:05:39 by jukim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require "oauth2"

UID = "ae9e6d9e006597971a180dff8af1af07e824d765a5e4a1a638c46be809f72e05"
SECRET = "6b438af8797de37a6c7a0d13a11f8a7bcd00ea5dfd2e284bf93409e014c37eb8"

$client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")
$token = $client.client_credentials.get_token

def stalk(login)
	begin
		response = $token.get("/v2/users/#{login}/locations")
		if response.status != 200
			puts "ERROR: ACCESS FAILED 🖕🖕"
		end
		if !response.parsed[0]["end_at"]
			puts ("👤" + login.ljust(10) + ": 🖥 " + response.parsed[0]["host"])
		else
			puts ("❌" + login.ljust(10) + ": NOT LOGGED IN")
			puts ("  👆 LAST LOGIN → " + response.parsed[0]["host"] + ")")
		end
	rescue
		puts (login.ljust(10) + ": INVALID USERNAME😱")
	end
end

if ARGV[0]
	if File.file?(ARGV[0]) and File.extname(ARGV[0]) == ".txt"
		file = File.open(ARGV[0], "r").each_line do |line|
			line == "\n" ? next : login = line.strip
			stalk(login)
		end
	else
		puts "ERROR: INVALID FILE 🖕🖕"
	end
else
	puts "ERROR: .txt FILE MISSING 🖕🖕"
end


require 'twitter' #gem install twitter
while true
	begin
		# Create a read write application from : 
		# https://apps.twitter.com
		# authenticate it for your account
		# fill in the following
		config = {
                        consumer_key:        'OdVjjb6iT4BGitt1cpU6GaJ0e',
                        consumer_secret:     '2bVEcSIXB9xCjr1TpGt7U1dAap8Vnj8tvl7zUAKiECe97RFvjL',
                        access_token:        '1029254814-AA33foPEAJ1c6iOEY0tM7aTDWb2QPCXFC1KmYKn',
                        access_token_secret: 'X6S9nZb94A5kcr5IsqJayVGzzusWyaSj1SvRsdGn7jWs7' 


		}
		rClient = Twitter::REST::Client.new config
		sClient = Twitter::Streaming::Client.new(config)
		# topics to watch
		topics = ['IRC', 'gondolatwitter', 'anonymous']
		sClient.filter(:track => topics.join(',')) do |tweet|
			if tweet.is_a?(Twitter::Tweet)
			  puts tweet.text 
			  rClient.fav tweet
			end
		end
	rescue
		puts 'error occurred, waiting for 5 seconds'
		sleep 5
	end
end

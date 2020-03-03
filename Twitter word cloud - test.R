#To set up access to Twitter API
# https://www.credera.com/blog/business-intelligence/twitter-analytics-using-r-part-1-extract-tweets/

library("twitteR")
library("ROAuth")
library("tm")
library("wordcloud")

# Load packages for sentiment analysis
library("ggplot2")
library("plyr")
library("gridExtra")
library("stringr")

# Download "cacert.pem" file
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#create an object "cred" that will save the authenticated object that we can use for later sessions
cred <- OAuthFactory$new(consumerKey='ZwWFpc8TCKsLq4DUlLFgnM3Qa',
                         consumerSecret='7zxcWpEWpdJyYBUNAodmyWRhalUBI1YZru4Qw9zvPnVmK72zAy',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

setup_twitter_oauth(consumer_key = "ZwWFpc8TCKsLq4DUlLFgnM3Qa", 
                    consumer_secret = "7zxcWpEWpdJyYBUNAodmyWRhalUBI1YZru4Qw9zvPnVmK72zAy",
                    access_token = "22164789-jXOcP4P9n32i5FlyrShawIC1AcmSWwnC9knvpNs4H", 
                    access_secret = "Z2a16Br1QThUZR5Gdu9gLeW3tzJnSmgnaH8OYlNpaiunt")



# https://www.credera.com/blog/business-intelligence/twitter-analytics-using-r-part-2-create-word-cloud/

load("twitter authentication.Rdata")
registerTwitterOAuth(cred)

search.string <- "#nba"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets, cainfo="cacert.pem", lang="en")
tweets
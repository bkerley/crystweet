require "json"
require "http/client"
require "./tweet/entities"
require "./*"

# TODO: Add Extended_Entities
# CONSIDER: Making all fields optional.
# Same for User. This is because both models are used in processing
# streaming results
module Twitter::Response
    abstract struct Tweet
        property id : UInt64
        property id_str : String
        property created_at : String # TODO: make datetime?
        property text : String
        property user : Twitter::Response::User
        property favorites_count : Int32?
        property retweet_count : Int32
        property lang : String?

        property in_reply_to_screen_name : String?
        property in_reply_to_user_id : UInt64?
        property in_reply_to_user_id_str : String?
        property in_reply_to_tweet_id : UInt64?
        property in_reply_to_tweet_id_str : String?
        property reply_count : Int32? # Not in doc

        property is_quote_tweet : Bool # Not in doc
        property quoted_tweet_id : UInt64?
        property quoted_tweet_id_str : String?
        property quote_count : Int32? # Not in doc

        property favorited : Bool?
        property retweeted : Bool?

               property entities : Entities
               property extended_entities : ExtendedEntities?

        property possibly_sensitive : Bool?
        property source : String?
        property filter_level : String?
        property withheld_copyright : Bool?
        property withheld_in_countries : Array(String)?
        property withheld_scope : String?

        # placeholder to get rid of the "instance variable _ was not initialized
        # in all of the 'initialize methods..." compilation error
        def initialize()
            raise "Don't call initialize() directly from the Abstract Tweet struct"
            @id = 0
            @id_str = "0"
            @created_at = ""
            @text = ""
            @user = Twitter::Response::User.new()
            @retweet_count = 0
            @is_quote_tweet = false
            @entities = Entities.new()
            @extended_entities = ExtendedEntities.new()
        end

        abstract def is_top_level? : Bool
        abstract def is_nested? : Bool

        def retweeted_tweet? : NestedTweet?
            @retweeted_tweet
        end

        def quoted_tweet? : NestedTweet?
            @quoted_tweet
        end

        def is_reply? : Bool
            return !@in_reply_to_screen_name.nil?
        end

        def is_retweet? : Bool
            return !@retweeted_tweet.nil?
        end

        def is_quote? : Bool
            return @is_quote_tweet
        end
    end
end

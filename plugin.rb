# name: Discourse Twitch Onebox
# about: Adds support for properly embedding Twitch streams, videos, and Clips within Discourse.
# version: 1.0
# authors: Daniel Marquard
# url: https://github.com/critcola/discourse-twitch-onebox

# Onebox for Twitch streams.
class Onebox::Engine::TwitchStreamOnebox
	include Onebox::Engine

	REGEX = /^https?:\/\/(?:www\.)?twitch\.tv\/(?!directory)([a-zA-Z0-9_]{4,25})$/
	matches_regexp REGEX

	def channel
		@url.match(REGEX)[1]
	end
	
	def to_html
		"<iframe src=\"//player.twitch.tv/?channel=#{channel}&autoplay=false\" width=\"620\" height=\"378\" frameborder=\"0\" style=\"overflow: hidden;\" scrolling=\"no\" allowfullscreen=\"allowfullscreen\"></iframe>"
	end
end

# Onebox for Twitch videos.
class Onebox::Engine::TwitchVideoOnebox
	include Onebox::Engine

	REGEX = /^https?:\/\/(?:www\.)?twitch\.tv\/(?!directory)[a-zA-Z0-9_]{4,25}\/v\/(\w+)/
	matches_regexp REGEX

	def id
		@url.match(REGEX)[1]
	end
	
	def to_html
		"<iframe src=\"//player.twitch.tv/?video=v#{id}&autoplay=false\" width=\"620\" height=\"378\" frameborder=\"0\" style=\"overflow: hidden;\" scrolling=\"no\" allowfullscreen=\"allowfullscreen\"></iframe>"
	end
end

# Onebox for Twitch Clips.
class Onebox::Engine::TwitchClipsOnebox
	include Onebox::Engine

	REGEX = /^https?:\/\/clips\.twitch\.tv\/([a-zA-Z0-9_]+\/?[^#\?\/]+)/
	matches_regexp REGEX

	def clip_path
		@url.match(REGEX)[1]
	end
	
	def to_html
		"<iframe src=\"//clips.twitch.tv/embed?clip=#{clip_path}&autoplay=false\" width=\"620\" height=\"378\" frameborder=\"0\" style=\"overflow: hidden;\" scrolling=\"no\" allowfullscreen=\"allowfullscreen\"></iframe>"
	end
end

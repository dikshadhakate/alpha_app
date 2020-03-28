module ApplicationHelper

	def gravator_for(user, options = { size: 80 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase) #It will fetch Image for selected Email
		size = options[:size] #It takes  the size of the image
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}" #Takes image url
		image_tag(gravatar_url, alt: user.username, class: "img-circle") #gives the image in circle format for selected user
	end
end

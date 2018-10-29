module ApplicationHelper
  def avatar_url(user)
    if user.image.present?
      user.image
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end
  end

  def stripe_express_path
    "https://connect.stripe.com/express/oauth/authorize?response_type=code&client_id=ca_DqQKhEsVszIVmJXVxFvkY1tjFe7JO7nf&scope=read_write"
  end
end

module ApplicationHelper
  def link_to_omniauth_provider(provider)
    if (provider == :facebook) || (provider == :twitter)
      provider_class = provider
    else
      provider_class = "google-plus"
    end

    provider_name = provider_class.to_s.humanize
    link_to image_tag("#{provider}.png"), user_omniauth_authorize_path(provider)
  end
end

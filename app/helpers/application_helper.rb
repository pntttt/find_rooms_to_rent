module ApplicationHelper
  def full_title page_title = ""
    base_title = t("title")
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end

  def avatar_url user
    gravatar_id = Digest::MD5.hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
  end
end

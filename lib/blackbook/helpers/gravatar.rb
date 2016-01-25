module GravatarHelper
  def gravatar_src( email )
    hash = Digest::MD5.hexdigest email.strip.downcase
    "http://www.gravatar.com/avatar/#{ hash }?s=290"
  end
end
class Link < ActiveRecord::Base
  after_create :generate_slug

  #This method will return the slug
  def display_slug
    Settings.base_url + self.slug
  end

  private

  #This will generate the slug
  def generate_slug
    self.slug = Base64.urlsafe_encode64 self.id.to_s
    self.save
  end

end

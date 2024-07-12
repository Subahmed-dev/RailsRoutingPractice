class Post < ApplicationRecord
  # validates :title, :body, presence: true
  validates :body, length: {minimum: 3, maximum: 100}
  # validates :title, uniqueness: true 


  before_save :set_title
  after_save :save_title

  private

  def set_title
    self.title = 'Default Title' if title.blank?
    self.body = 'Default Body' if body.blank?
  end

  
  def save_title
    Rails.logger.info "Post saved!"
    
  end
end

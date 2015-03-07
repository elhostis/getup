class New < ActiveRecord::Base
  include Filterable

  # Validations
  validates :title, :presence => true

  # Scopes
  scope :scope_published, -> (status) { where publish: status }
  scope :scope_text, -> (term) {
        word_sql = "%#{term}%"
        self.where('lower(news.title) LIKE ?', word_sql)
  }

  mount_uploader :image, LogoUploader

  def publishing(publish_action = true)
    return update_attributes({:publish => publish_action})
  end

end

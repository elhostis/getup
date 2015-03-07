class Activite < ActiveRecord::Base
  include Filterable
  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged

  has_many :sousactivites, :dependent => :destroy

  # Validations
  validates :title, :presence => true

  # Scopes
  scope :scope_published, -> (status) { where publish: status }
  scope :scope_activite_id, -> (activite_id) { where id: activite_id }
  scope :scope_text, -> (term) {
        word_sql = "%#{term}%"
        self.where('lower(activites.title) LIKE ?', word_sql)
  }

  def slug_candidates
    [
      :title
    ]
  end

  def all_images
    list_image = []
    sousactivites.each do |sousactivite|
      sousactivite.sousactivite_images.each do |sousactivite_image|
        list_image << sousactivite_image.image
      end
    end
    return list_image
  end

  def publishing(publish_action = true)
    sousactivites.each { |a| a.publishing(publish_action) }
    return update_attributes({:publish => publish_action})
  end

end

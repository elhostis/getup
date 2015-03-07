class Sousactivite < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged

  belongs_to :activite
  has_many :sousactivite_images, :dependent => :destroy
  accepts_nested_attributes_for :sousactivite_images

  scope :scope_published, -> (status) { where publish: status }

  def slug_candidates
    [
      :title
    ]
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def publishing(publish_action = true)
    return update_attributes({:publish => publish_action})
  end

end

class Page < ActiveRecord::Base

  validates :title, :presence => true

  extend FriendlyId
  friendly_id :name, :use => :slugged

  is_a_leaf

  mount_uploader :image, PageImageUploader
  mount_uploader :image_2, PageImageUploader

  def name
    title
  end

  def route
    "{:controller => '/pages', :action => 'show', :id => '#{self.slug}'}"
  end

  def self.layouts
    %w{ application }
  end

  def self.styles
    %w{ basic }
  end

end

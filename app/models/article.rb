class Article < ApplicationRecord
  has_many :profiles, through: :users
  
  include Visible

  has_many :comments, dependent: :destroy
  has_one_attached :icon, dependent: :detach

  has_many :taggings
  belongs_to :tag, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }
  
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def to_partial_path
    "profiles/profile"
  end
  
  def delete_icon
    @icon = ActiveStorage::Blob.find(params[:id])
    @icon.purge
    redirect_to root_path
  end

  def archived?
    status == 'archived'
  end
end

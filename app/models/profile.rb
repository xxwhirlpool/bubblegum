class Profile < ApplicationRecord
  has_many :articles, through: :users
  
  has_one_attached :icon, dependent: :detach
  
  def delete_icon
    @icon = ActiveStorage::Blob.find(params[:id])
    @icon.purge
    redirect_to root_path
  end
end

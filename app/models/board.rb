class Board < ApplicationRecord
    resourcify
    belongs_to :user
    has_many :comments
    paginates_per 5
    mount_uploader :image, IamgeUploader
 
    # 削除し、AWS S3 SERVERにも自動削除
    before_destroy :destroy_assets
 
    def destroy_assets
        self.image.remove! if self.image
        self.save!
    end
end

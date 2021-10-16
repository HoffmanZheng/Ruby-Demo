class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  has_one_attached :image
  # 验证图像文件的格式和大小
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                    size:         { less_than: 5.megabytes,
                                    message: "should be less than 5MB" }

  # 显示调整尺寸后的图像                                  
  def display_image
    # variant 是按需使用的，首次调用后会被缓存
    image.variant(resize_to_limit: [500, 500])
  end
end

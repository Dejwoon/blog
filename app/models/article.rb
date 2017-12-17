class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  belongs_to :author, class_name: "User"
  has_many :likes

 def tags=(value)
    value = sanitize_tags(value) if value.is_a?(String)
    super(value)
  end

 private

 def sanitize_tags(value)
    value.downcase.split.uniq
  end
end

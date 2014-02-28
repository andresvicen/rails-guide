class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
                    
  def self.search_by_title title
    where "title like :title", {:title => "%#{title}%"}
  end               

end

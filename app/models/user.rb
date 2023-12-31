class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post
    has_many :answers, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :messages, dependent: :destroy

    mount_uploader :avatar, AvatarUploader
    
    validates :status, numericality: { greater_than_or_equal_to: 0 }
    validates :email, presence: true
    validates :name, presence: true
    validates :introduction, length: { maximum: 655 }
    
    scope :most_user, -> {
        joins(posts: :answers)
            .select("users.name")
            .where("answers.answer_select = '0'")
            .group('users.name')
            .order("COUNT(posts.user_id) DESC")
            .first
    }
    
    class << self
        def find_or_create_from_auth_hash(auth_hash)
            user_params = user_params_from_auth_hash(auth_hash)
            find_or_create_by(email: user_params[:email]) do |user|
                user.update(user_params)
            end
        end
            
      private
    
        def user_params_from_auth_hash(auth_hash)
        {
            name: auth_hash.info.name,
            email: auth_hash.info.email,
            image: auth_hash.info.image,
        }
        end
    end

    def own?(object)
        id == object.user_id
    end

    def like(post)
        liked_posts << post
    end

    def unlike(post)
        liked_posts.destroy(post)
    end

    def like?(post)
        liked_posts.include?(post)
    end

    def calculate_status
        self.status =  0 + answers.yes_count
        save!
    end

    def has_yes?
        self.answers.exists?(answer_select: "yes")
    end
end

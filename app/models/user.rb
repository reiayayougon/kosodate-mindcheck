class User < ApplicationRecord
    has_many :posts, dependent: :destroy

    validates :email, presence: true
    validates :name, presence: true
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post
    has_many :comments, dependent: :destroy

    validates :status, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    

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

end

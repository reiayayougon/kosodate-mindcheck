10.times do |i|
    User.find_or_create_by(email: "user#{i + 1}@example.com") do |user|
        user.name = "User #{i + 1}"
    end
end


category_names = ["保育園・幼稚園", "食事", "病気・怪我", "義理母・義理父", "妻・夫", "友人", "ママ友", "乳児期", "幼児期初期〜後期", "児童期", "青年期", "お金", "その他"] 
category_names.each do |name|
    category = Category.find_or_create_by(name: name)
end

20.times do |index|
    post = Post.new(
        user: User.offset(rand(User.count)).first,
        content: "本文#{index}",
    )
    
    random_category = Category.offset(rand(Category.count)).first
    post.category = random_category
    post.save!
end
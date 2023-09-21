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

questions = [
    { content: "妻(夫)の育児に言いたいことがあるが言えない", category: Category.find_by(name: "妻・夫") },
    { content: "子供のイヤイヤ期に怒鳴ってばかり", category: Category.find_by(name: "幼児期初期〜後期") },
    { content: "保育園（幼稚園)での虐待などが心配", category: Category.find_by(name: "保育園・幼稚園") },
    { content: "好き嫌いが激しすぎて今後の健康が心配", category: Category.find_by(name: "病気・怪我") },
    { content: "義理母(義理父)が昔の子育てと比べてくるのがなんか嫌", category: Category.find_by(name: "病気・怪我") },
    { content: "外で遊ばなくて心配になる", category: Category.find_by(name: "児童期") },
    { content: "子育てに関して相談できる人があまりいない", category: Category.find_by(name: "その他") },
    { content: "食事のバラエティに悩む", category: Category.find_by(name: "食事") },
    { content: "風邪ばかり引いて心配になる", category: Category.find_by(name: "病気・怪我") },
    { content: "将来の健康が心配", category: Category.find_by(name: "病気・怪我") },
    { content: "学費を払っていけるか心配", category: Category.find_by(name: "お金") },
    { content: "カーテンがケチャップだらけになって泣きたくなった", category: Category.find_by(name: "幼児期初期〜後期") },
    { content: "子育てをして気づけば自分の体重が激減", category: Category.find_by(name: "病気・怪我") },
    { content: "友人とライフステージが違うでなかなか話が合わない", category: Category.find_by(name: "友人") },
]

questions.each do |question_data|
    Question.create(question_data)
end
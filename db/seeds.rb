# 10.times do |i|
#     User.find_or_create_by(email: "user#{i + 1}@example.com") do |user|
#         user.name = "User #{i + 1}"
#     end
# end


category_names = ["保育園・幼稚園", "食事", "健康・病気・怪我", "義理母・義理父", "妻・夫", "友人", "ママ友", "乳児期", "幼児期初期〜後期", "児童期", "青年期", "お金", "その他"] 
category_names.each do |name|
    category = Category.find_or_create_by(name: name)
end

# 20.times do |index|
#     post = Post.new(
#         user: User.offset(rand(User.count)).first,
#         content: "本文#{index}",
#     )
    
#     random_category = Category.offset(rand(Category.count)).first
#     post.category = random_category
#     post.save!
# end


questions = [
    { content: "妻(夫)の育児に言いたいことがあるが言えない", category_name: "妻・夫" },
    { content: "子供のイヤイヤ期に怒鳴ってばかり", category_name: "幼児期初期〜後期" },
    { content: "保育園（幼稚園)での虐待などが心配", category_name: "保育園・幼稚園" },
    { content: "子供の好き嫌いが激しすぎて今後の健康が心配", category_name: "健康・病気・怪我" },
    { content: "義理母(義理父)が昔の子育てと比べてくるのがなんか嫌", category_name: "健康・病気・怪我" },
    { content: "うちの子はテレビばかり見ている。今後引きこもらないか心配になる", category_name: "児童期" },
    { content: "子育てに関して相談できる人があまりいない", category_name: "その他" },
    { content: "子供食事のバラエティに悩む", category_name: "食事" },
    { content: "子供が風邪ばかり引いて心配になる", category_name: "健康・病気・怪我" },
    { content: "子供の将来の健康が心配", category_name: "健康・病気・怪我" },
    { content: "学費を払っていけるか心配", category_name: "お金" },
    { content: "カーテンがケチャップだらけになって泣きたくなった", category_name: "幼児期初期〜後期" },
    { content: "子育てをして気づけば自分の体重が激減(激増)", category_name: "健康・病気・怪我" },
    { content: "友人とライフステージが違うでなかなか話が合わない", category_name: "友人" },
    { content: "自分が作っているご飯は栄養バランスが取れているのか不安", category_name: "食事" },
    { content: "うちの子はいじめられていないか、誰かをいじめていないか心配", category_name: "その他" },
    { content: "毎日学校で顔合わせる友達との事で悩んでいるとき、気軽に『気にしない』とは言えない..どうサポートしたらいいのかわからない..", category_name: "その他" },
    { content: "子供が勉強しない..", category_name: "その他" },
    { content: "普通食が始まり子供が自分で食べれるように横で見守るようにしている。けど口に運べるのは１割、９割床...てかご飯で遊んでるーー..", category_name: "幼児期初期〜後期" },
    { content: "子供の教育費をどのように計画すればいいのかわからない", category_name: "お金" },
    { content: "寝返りできそうな頃、うつ伏せで窒息していないか心配。常に生存確認なので熟睡できない日々。むしろ不安で目が覚める", category_name: "乳児期" },
    { content: "何でも自分でやりたい時期に突入。よし、今日は朝の出発時間は余裕を持てて順調な1日。玄関で靴履きに1時間...悲しすぎる", category_name: "幼児期初期〜後期" },
    { content: "友人の子供と自分の子供を比較してしまい、友人関係にストレスを感じる", category_name: "友人" },
    { content: "子供と友人の子供の関係がよくなく、友人との関係もイマイチになってきた", category_name: "友人" },
    { content: "友人と子供を育てる方法や価値観が異なり、対立してしまい昔のいい関係が崩れつつある", category_name: "友人" },
    { content: "友人同士で子供の成績や成長を比較してしまい、友人付き合いが嫌になってきた", category_name: "友人" },
    { content: "義理母(父)が子供に過剰に干渉してくるのやめてほしい", category_name: "義理母・義理父" },
    { content: "子供の服を買うのが楽しみなのに、義理母(父)が服をどんどん買ってくるのやめてほしい..有難いんだけどさ..着せたい服の趣味違うし..", category_name: "義理母・義理父" },
    { content: "義理母と義理父はよく喧嘩をしているけど子供の前でやるのやめてほしい", category_name: "義理母・義理父" }
]
questions.each do |question_data|
    category_name = question_data.delete(:category_name)
    category = Category.find_or_create_by(name: category_name)
    user = User.offset(rand(User.count)).first
    question_data[:user] = user
    question_data[:category] = category
    Question.create(question_data)
end
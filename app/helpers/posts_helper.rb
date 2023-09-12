module PostsHelper
    def translation_class_name(name)
        if name == "食事"
            name.gsub(name, "eat")
        elsif name == "保育園・幼稚園"
            name.gsub(name, "school")
        elsif name == "義理母・義理父"
            name.gsub(name, "mother_in_law")
        elsif name == "病気・怪我"
            name.gsub(name, "sickness")
        elsif name == "妻・夫"
            name.gsub(name, "wife-husband")
        elsif name == "友人"
            name.gsub(name, "friend")
        elsif name == "乳児期"
            name.gsub(name, "baby")
        elsif name == "幼児期初期〜後期"
            name.gsub(name, "infant")
        elsif name == "児童期"
            name.gsub(name, "child")
        elsif name == "青年期"
            name.gsub(name, "youth")
        elsif name == "お金"
            name.gsub(name, "money")
        elsif name == "その他"
            name.gsub(name, "others")
        end
    end
end

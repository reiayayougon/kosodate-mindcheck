module ApplicationHelper
    
    def turbo_stream_flash
        turbo_stream.prepend "flash", partial: "shared/flash_message"
    end

    def render_flash_messages
        render turbo_stream: [
            turbo_stream.replace("flash_message", partial: "shared/flash_message")
        ]
    end

    def flash_class(type)
        case type
        when "success"
            "bg-blue-300 border border-blue-300 text-slate-700 px-4 py-3 rounded relative"
        when "error"
            "bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative"
        else
            ""
        end
    end

    def default_meta_tags
        def default_meta_tags
        {
            site: '子育てマッチング',
            title: '子育て仲間作成アプリ',
            reverse: true,
            separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
            description: 'このアプリは子育て仲間を作成を応援するアプリです。',
            keywords: '子育て, 子育て仲間, ママ友, パパ友, 子育て'  #キーワードを「,」区切りで設定する
            canonical: request.original_url,   #優先するurlを指定する
            noindex: ! Rails.env.production?,
            icon: [                    #favicon、apple用アイコンを指定する
                { href: image_url('favicon.ico') },
                { href: image_url('logo.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
            ],
            og: {
                site_name: '子育てマッチング',
                title: '子育て仲間作成アプリ',
                description: 'このアプリは子育て仲間を作成を応援するアプリです。', 
                type: 'website',
                url: request.original_url,
                image: image_url('logo.png'),
                locale: 'ja_JP',
            },
            twitter: {
                card: 'summary_large_image',
                site: '@GontaWeb556035',
            }
            }
        end
    end


end

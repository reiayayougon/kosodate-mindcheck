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
        {
            site: '子育てマッチング',
            title: '子育て仲間作成サービス',
            reverse: true,
            charset: 'utf-8',
            description: 'このアプリは子育て仲間を作成を応援するアプリです。',
            keywords: '子育て,子育て仲間,ママ友,パパ友,子育て',  #キーワードを「,」区切りで設定する
            canonical: request.original_url,   #優先するurlを指定する
            separator: '|',
            og: {
                site_name: :site,
                title: :title,
                description: :description,
                type: 'website',
                url: request.original_url,
                image: image_url('twitter.png'), # 配置するパスやファイル名によって変更すること
                local: 'ja-JP'
            },
            twitter: {
                card: 'summary_large_image',
                site: '@GontaWeb556035',
                image: image_url('twitter.png')
            }
        }
    end
end

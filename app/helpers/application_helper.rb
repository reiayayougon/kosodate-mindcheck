module ApplicationHelper
    
    def turbo_stream_flash
        turbo_stream.prepend "flash", partial: "shared/flash_message"
    end

    def render_flash_messages
        render turbo_stream: [
            turbo_stream.replace("flash_messages", partial: "shared/flash_messages")
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


end

module ApplicationHelper
    
    def turbo_stream_flash
        turbo_stream.append 'flash', partial: 'shared/flash_message'
    end

    def flash_class(type)
        case type
        when "success"
            "bg-green-300 border border-green-300 text-green-700 px-4 py-3 rounded relative"
        else "error"
            "bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative"
        end
    end


    def flash_close_icon_color(type)
        case type
        when "success"
            "text-green-500"
        when "error"
            "text-red-500"
        else
            "text-gray-500"
        end
    end
end

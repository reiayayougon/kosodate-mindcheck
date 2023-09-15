module ApplicationHelper
    
    def turbo_stream_flash
        turbo_stream.append 'flash', partial: 'shared/flash_message'
    end
end

module ApplicationHelper
    def is_active?(controller)
        if params[:controller] == controller
            "active"
        end
    end
end

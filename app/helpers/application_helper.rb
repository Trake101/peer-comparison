module ApplicationHelper
  def highlight_tab(tab)
    content_for(:highlighted_tab) do
      "#{tab}"
    end
  end   
end

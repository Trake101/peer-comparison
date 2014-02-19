module ApplicationHelper
  def highlight_tab(tab)
    content_for(:highlighted_tab) do
      "#{tab}"
    end
  end

  def characteristic_description(characteristic)
    case(characteristic)
      when :fips        then  "FIPS"
      when :sector      then  "Sector"
      when :deg_grant   then  "Degrees Granted"
      when :hbcu        then  "Historically Black College/University"
      when :tribal      then  "Tribal"
      when :land_grant  then  "Land Grant"
      when :carnegie    then  "Carnegie Classification"
      else characteristic.to_s.capitalize!
    end
  end

  def color_class(value)
    if value < 1 then
      return "factor-one"
    elsif value < 2
      return "factor-two"
    elsif value < 3
      return "factor-three"
    elsif value < 4
      return "factor-four"
    elsif value < 5
      return "factor-five"
    else
      return "factor-six"
    end
  end 
end

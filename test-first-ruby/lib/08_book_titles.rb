class Book
  def title=(title)
    first = true
    @title = title.split(" ")
    @title.map! do |x|
      case x
        when 'and', 'the', 'a', 'an', 'in', 'the', 'of'
          if !first
            first = false
            x
          else
            x.capitalize
          end
      else
        first = false
        x.capitalize
      end
    end
    @title = @title.join(" ")
  end

  def title
    @title
  end
end

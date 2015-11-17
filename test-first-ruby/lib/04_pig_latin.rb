def translate(word)
  first = ''
  second = ''
  third = ' '
  word = word.split(" ")
  word.map! do |x|
    x = x.split('')
    case x[0]
      when 'a', 'e', 'i', 'o', 'u'
        x.push('ay')
      when 'q'
        first = x.shift
        second = x.shift
        x.push(first + second + 'ay')
    else
      case x[1]
        when 'a', 'e', 'i', 'o', 'u'
          first = x.shift
          x.push(first +'ay')
        when 'q'
          first = x.shift
          second = x.shift
          third = x.shift
          x.push(first + second + third + 'ay')
      else
        case x[2]
          when 'a', 'e', 'i', 'o', 'u'
            first = x.shift
            second = x.shift
            x.push(first + second + 'ay')
        else
        first = x.shift
        second = x.shift
        third = x.shift
        x.push(first + second + third + 'ay')
        end
      end
    end
    x = x.join
  end
  word = word.join(" ")
  return word
end

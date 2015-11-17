class Fixnum
  def in_words
    @str = ""
    @words = {0 =>"zero",1=>"one",2=>"two",3=>"three",4=>"four",5=>"five",
      6=>"six",7=>"seven",8=>"eight",9=>"nine",10=>"ten",11=>"eleven",
      12=>"twelve",13=>"thirteen",14=>"fourteen", 15=>"fifteen",16=>"sixteen",
      17=>"seventeen",18=>"eighteen",19=>"nineteen" ,20=>"twenty", 30=>"thirty",
      40=>"forty",50=>"fifty",60=>"sixty",70=>"seventy",80=>"eighty",
      90=>"ninety"}
    if self < 20
      return tens_and_ones(self)
    elsif self >= 20 and self < 100
      return tens_and_ones(self)
    elsif self >= 100 and self < 1000
      if self % 10 == 0
        return hundreds(self)
      end
      return (hundreds(self) + " " + tens_and_ones(self%100))
    elsif self >= 1000 and self < 1000000
      if self % 1000 == 0
        return thousands(self)
      elsif self % 100 == 0
        return (thousands(self) + " " + tens_and_ones(self%1000))
      end
      return (thousands(self) + " " +
          + hundreds(self%1000) + " " + tens_and_ones(self%100))
    end
  end

  def tens_and_ones(num)
    if num < 20 or num % 10 == 0
      return @str = @words[num]
    end
    return @str = (@words[num / 10 * 10] + " " + @words[num%10])
  end

  def hundreds(num)
    return @str = (@words[num/100] + " hundred")
  end

  def thousands(num)
    if num / 1000 > 9
      return @str = (tens_and_ones(num/1000) + " thousand")
    end
    return @str = (@words[num/1000] + " thousand")
  end
end

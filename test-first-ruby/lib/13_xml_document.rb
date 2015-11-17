class XmlDocument
  def initialize
    @value = ""
  end
  def hello(opts = {})
    if opts.keys == nil
      return @value = "<hello>"
    end
    opts.each do |x|

  end
end

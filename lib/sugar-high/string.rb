class String
  def insert_before_last str, marker = 'end'
    res = []
    found = false
    marker = case marker
    when Symbol, String
      marker.to_s
    when Hash
      marker[:marker].to_s
    else
      raise ArgumentException, "last argument is the marker and must be a String, Symbol or even Hash with a :marker option pointing to the marker (String or Symbol)"
    end      
  
    marker = Regexp.escape(marker.reverse)
    nl = Regexp.escape("\n")
    # puts self
    # puts "marker: #{marker}"
    # puts "nl: #{nl}"    
    # puts "str: #{str}"    
  
    self.reverse.each_line do |x|
      x.gsub! /#{nl}/, ''  
      if !found && x =~ /#{marker}/
        replace = "#{str}\n" << x.reverse
        res << replace
        found = true
      else
        res << x.reverse
      end
    end    
    res = res.reverse.join("\n")
  end
end
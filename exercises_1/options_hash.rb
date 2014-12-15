def super_print(string, options = {})
  output = ""
  defaults = {
    :times => 1,
    :upcase => false,
    :reverse => false
  }
  defaults.merge!(options)
  output = string * defaults[:times]
  output.upcase! if defaults[:upcase]
  output.reverse! if defaults[:reverse]
  output
end

p super_print("Hello")
p super_print("Hello", :times => 3)                       #=> "Hello" 3x
p super_print("Hello", :upcase => true)                   #=> "HELLO"
p super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"

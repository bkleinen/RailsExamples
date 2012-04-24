# Exercise: write a proc that provides content for the following html template:
def template
  template =<<DELIM
<html>
<head>
#{yield :head}
</head>
<body>
#{yield}
<hr>
<p>
#{yield :footer}
</p>
</body>
</html>
DELIM
  return template
end 

content_definitions = ->(*arg) do
  case arg[0]
  when :footer
    result =  "FOOTER"
  when :head
    result =  "HEADER"
  else
    result = "CONTENT"
  end
  result
end
#e.g. call with
puts template &content_definitions
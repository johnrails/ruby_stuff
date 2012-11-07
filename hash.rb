# make a ruby hash respond to . notation
# example person = {name: "John", age:"37}
#   person.name # "John"
#
# source http://www.goodercode.com/wp/convert-your-hash-keys-to-object-properties-in-ruby/
  class ::Hash
    def method_missing(name)
      return self[name] if key? name
      self.each { |k,v| return v if k.to_s.to_sym == name }
      super.method_missing name
    end
  end


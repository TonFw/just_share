class String
  # Humanize the String format rails humanized (but renamed to not have conflicts & REFACTORED)
  def capitalize_humanized
    # Replace underscore to whitespace
    self.gsub!('_', ' ')

    # Split on where are the hyphens
    self_in_array = self.split(/-/)

    # Recreate Capitalizing
    it_new_format = ''
    self_in_array.each do |sub_str|
      it_new_format = it_new_format+sub_str.capitalize
    end

    # Return it new format
    it_new_format
  end

  # Helpful for the RSpec test
  def equals? str
    self == str
  end

  # Return it last char
  def last
    self[self.length-1]
  end

  # Rails Constantize (but renamed to not have conflicts)
  def to_constant
    camel_cased_word = self
    names = camel_cased_word.split('::')

    # Trigger a builtin NameError exception including the ill-formed constant in the message.
    Object.const_get(camel_cased_word) if names.empty?

    # Remove the first blank element in case of '::ClassName' notation.
    names.shift if names.size > 1 && names.first.empty?

    names.inject(Object) do |constant, name|
      if constant == Object
        constant.const_get(name)
      else
        candidate = constant.const_get(name)
        next candidate if constant.const_defined?(name, false)
=begin TODO UNCOMMENT IF ANYTHING CRASH
        next candidate unless Object.const_defined?(name)

        # Go down the ancestors to check it it's owned
        # directly before we reach Object or the end of ancestors.
        constant = constant.ancestors.inject do |const, ancestor|
          break const    if ancestor == Object
          break ancestor if ancestor.const_defined?(name, false)
          const
        end

        # owner is in Object, so raise
        constant.const_get(name, false)
=end
      end
    end
  end
end
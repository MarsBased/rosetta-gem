unless Hash.instance_methods.include?(:dig)
  Hash.class_eval do
    def dig(key, *args)
      value = self[key]
      return value if args.length == 0 || value.nil?

      value.dig(*args)
    end
  end
end

unless Array.instance_methods.include?(:dig)
  Array.class_eval do
    def dig(key, *args)
      value = self.at(key)
      return value if args.length == 0 || value.nil?

      value.dig(*args)
    end
  end
end

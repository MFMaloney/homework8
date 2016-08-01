  def in_groups_of(number, fill_with = nil)
    # defines a method and the arguments it takes
    if number.to_i <= 0
      # it checks to see if the number entered is less than or = to 0
      raise ArgumentError,
      # when the If statement is true, it will return an error
        "Group size must be a positive integer, was #{number.inspect}"
        # the text the error will display
    end
    # ends the method

    if fill_with == false
      # checks to see if the fill_with is needed
      collection = self
      # sets the variable 'collection' to the number entered as an argument
    else
      # size % number gives how many extra we have;
      # subtracting from number gives how many to add;
      # modulo number ensures we don't add group of just fill.
      padding = (number - in_groups_of.size % number) % number
      #sets the number of 'fill_with' that will be needed to fill out the group
      collection = dup.concat(Array.new(padding, fill_with))
      #is duplicating the array and adding in however many 'fill_with' 
      #it determined was needed
    end

    if block_given?
      collection.each_slice(number) { |slice| yield(slice) }
      #if block_given is true, it goes through each entry in collection 
      #and puts it in a hash
    else
      collection.each_slice(number).to_a
      #if block_given is false, it goes through each entry in collection
      #and converts it into an array
    end
  end

  puts [1,2,3,4,5,10].in_groups_of(4)

  
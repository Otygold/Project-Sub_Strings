def substrings(input, dictionary)
    # Normalize the input and split it into words
    words = input.downcase.scan(/\b[\w']+\b/) # includes apostrophes
  
    # Create a frequency counter for each word
    word_counts = Hash.new(0)
    words.each { |word| word_counts[word] += 1 }
  
    # Build the result hash from the dictionary
    result = {}
  
    dictionary.each do |entry|
      entry_down = entry.downcase
      count = word_counts[entry_down]
      result[entry_down] = count if count > 0
    end
  
    result
  end
  
  puts "Enter a string to search for substrings:"
  input_string = gets.chomp
  puts "Enter a dictionary of words (Separate each word with a comma.):"
  dictionary_input = gets.chomp
  
  # Split the dictionary input into an array of words and remove leading/trailing spaces
  dictionary = dictionary_input.split(',').map(&:strip)
  
  result = substrings(input_string, dictionary)
  puts "Substring counts: #{result}"
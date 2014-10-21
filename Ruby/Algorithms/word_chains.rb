class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = Set.new
    File.readlines(dictionary_file_name).each do |line| 
      @dictionary << line.chomp
    end
  end
  
  def adjacent_words(word)
    # return all words in the dictionary one letter different than current words
    @dictionary.select! { |item| item.length == word.length }
    
    
    @dictionary.each do |item|
      count = 0
      word.length.times do |char|
        count += 1 unless item.include?(char)
      end
      @dictionary.delete(item) if count > 1
    end            
  end
  
end
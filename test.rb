def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end


def respect_grid?(word)
    if @letters.nil? == false
      grid_array = @array
      word_array = word.upcase.split('')
      word_array.each do |letter|
        if grid_array.include?(letter)
          grid_array.delete_at(grid_array.index(letter))
          puts grid_array
          else
          false
        end
      end
    end
  end


puts respect_grid?('word')
# new
# puts @letters
# puts respect_grid?('word')



grid = new

 array = ["W","O","R","D"]
def grid_check(attempt, grid)
    attempt.upcase.split(" ").map { |element| grid.include?(element) ? grid.delete_at(grid.index(element)) : 'false' }
  end

 puts grid_check("word", array)


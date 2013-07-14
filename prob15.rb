
# http://projecteuler.net/problem=15
#
# Starting in the top left corner of a 2x2 grid, and only being able to move to
# the right and down, there are exactly 6 routes to the bottom right corner.
#
#  (image from URL)
#
# How many such routes are there through a 20x20 grid?

# Solution
#
# Traverse an (N+1)x(N+1) matrix representing the nodes in an NxN grid,
# calculate the number of paths to the endpoint starting from each point.
# Begin from the lower-right corner (the end) and work backwards towards the
# top-left corner, traversing each antidiagonal* until the top-left value is
# reached.  Within each antidiagonal, the same answer results regardless of
# order of elements visited.
#
# The solution is the value in (0,0) of the array.
#
# *Antidiagonal: The diagonal of a square matrix from the top right to the
# bottom left corner

# ===============================  Support Code ================================
class SolutionGrid
  attr_accessor :size
  def initialize grid_size
    @size = grid_size + 1
    # Creates a size x size 2d array with each value initialized to nil.  A
    # Ruby matrix isn't used here as matrices are immutable; each change to an
    # element requires copying the entire matrix and changing one element.
    @grid = Array.new(@size) { Array.new(@size) }
    populate_grid
  end

  def number_of_paths
    @grid[0][0]
  end

  #private
  class MatrixPosition
    attr_accessor :row, :column
    def initialize(row, column)
      @row = row
      @column = column
    end

  end

  def populate_grid
    antidiagonal_starts.each do |antidiag_start|
      populate_antidiagonal antidiag_start
    end
  end

  # Returns an array of matrix positions, beginning with the lower-right and
  # moving left until the left edge, then upward along the left edge.
  def antidiagonal_starts
    result = []
    # Insert the antidiagonal starts along the bottom edge first, beginning on
    # the right side
    (1..size).each do |n|
      result.push MatrixPosition.new(size-1, size-n)
    end

    # Start at 2 since the last iterator covered (size-1, 0)
    (2..size).each do |n|
      result.push MatrixPosition.new(size-n, 0)
    end

    result
  end

  def populate_antidiagonal antidiagonal_start
    current_position = antidiagonal_start
    if current_position.row == @size - 1 && current_position.column == @size - 1
      @grid[current_position.row][current_position.column] = 1
    else

      loop do
        value_below = if current_position.row + 1 >= @size
                        0
                        else
                          @grid[current_position.row + 1][current_position.column]
                        end
        value_right = if current_position.column + 1 >= @size
                        0
                        else
                          @grid[current_position.row][current_position.column + 1]
                        end

        @grid[current_position.row][current_position.column] = value_below + value_right

        if last_in_antidiagonal?(current_position)
          break
        else
          current_position = MatrixPosition.new(current_position.row-1, current_position.column + 1)
        end
      end
    end
  end

  def last_in_antidiagonal? matrix_position
    matrix_position.row - 1 < 0 || matrix_position.column + 1 >= size
  end

end

# ==============================  Solution Code ===============================

solution_grid = SolutionGrid.new 20
puts "The number of routes following the rules in the prompt for a 20 x 20 grid is: "
puts solution_grid.number_of_paths

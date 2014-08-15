class Eratosthenes
  def self.primes(upper)
    nums = (2..upper).to_a
    iend = nums.size - 1
    sqrt = Math.sqrt(upper).to_i
    (0..(nums.index(sqrt))).each do |i|
      n = nums[i]    # n is either prime or nil
      (i + n).step(iend, n) { |j| nums[j] = nil } unless n.nil?
   end
   nums.compact!     # eliminate nil entries
  end
end

class Table
  def self.cute_table(x,y)
    @x = x
    @y = y
    out = ""
    #make the space in the top left corner (TLC)
    out << ' '*(max_cell_width+2)
    #create the header
    @x.each {|i| out << "%-#{max_cell_width}d  " % i}
    out << "\n"
    #create the lower half of the space in the TLC
    out << " "*(max_cell_width+2)
    #underscores under each of the above header numbers
    @x.each {|i| out << '-'*max_cell_width+"  "}
    out << "\n"
    @y.each do |j|
        out << "%-#{max_cell_width}d| " % j
        @x.each {|i| out << "%-#{max_cell_width}d  " % math(i,j)}
        out << "\n"
    end
    out
  end

  def self.max_cell_width
    @x_max ||= @x.sort.last
    @y_max ||= @y.sort.last
    max_cell_width ||= (@x_max*@y_max).to_s.length.to_i
  end

  def self.math(a,b)
    (a*b)
  end
end

# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
  start_board = setup(board_string)
  number_selection = number_set(board_string)
  solution_board = populate_board(start_board, number_selection)
  solution_board
end

def setup(board_string)
  split_board = board_string.split('')
  split_board
  x_position, y_position = 0, 0
  hash = {}
  split_board.each do |value|
    hash["#{x_position},#{y_position}"] = value
    if x_position == (Math.sqrt(split_board.length)-1)
      x_position = 0
      y_position += 1
    else
      x_position += 1
    end
  end
  hash
end

def number_set(board_string)
  split_board = board_string.split('')
  number_set = [*1...(Math.sqrt(split_board.length) + 1)]
end

def populate_board(start_board, number_selection)
  start_board.each do |coordinate, entry|
    if entry == "-"
      start_board[coordinate] = number_selection.sample
    end
  end
end
# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  row_solve?(board) && column_solve?(board)
end

def row_solve?(board)
  all_sum =[]
  (Math.sqrt(board.length)).to_i.times do |i|
    all_sum << sum_row(board, i)
  end
  all_sum.each do |num|
    return false if num != all_sum[0]
  end
  return true
end

def sum_row(board, row_num)
  sum = 0
  (Math.sqrt(board.length)).to_i.times do |i|
    key = i.to_s + "," + row_num.to_s
    sum += board[key].to_i
    # p "#{i} times: value of #{key} is  #{board[key].to_i}"
    # p "sum: #{sum}"
  end
  sum
end

def column_solve?(board)
  all_sum =[]
  (Math.sqrt(board.length)).to_i.times do |i|
    all_sum << sum_column(board, i)
  end
  all_sum.each do |num|
    return false if num != all_sum[0]
  end
  return true
end

def sum_column(board, column_num)
  sum = 0
  (Math.sqrt(board.length)).to_i.times do |i|
    key = column_num.to_s + "," + i.to_s
    sum += board[key].to_i
    # p "#{i} times: value of #{key} is  #{board[key].to_i}"
    # p "sum: #{sum}"
  end
  sum
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.

def pretty_board(board)
  board.each do |coordinate, entry|
    # 3.times do
      print "#{entry}"
    # end
    print "\n" if coordinate[0] == (Math.sqrt(board.length)-1).to_i.to_s
  end
end

# board = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--
# --5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3
# 29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9
# -8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-
# 6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--
# ---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----
# -3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--
# -96-4---11---6---45-481-39---795--43-3--8----4-5-23-18-1-63--59-59-7-83---359---7
# ----754----------8-8-19----3----1-6--------34----6817-2-4---6-39------2-53-2-----
# 3---------5-7-3--8----28-7-7------43-----------39-41-54--3--8--1---4----968---2--
# 3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-
# -2-5----48-5--------48-9-2------5-73-9-----6-25-9------3-6-18--------4-71----4-9-
# --7--8------2---6-65--79----7----3-5-83---67-2-1----8----71--38-2---5------4--2--
# ----------2-65-------18--4--9----6-4-3---57-------------------73------9----------
# ---------------------------------------------------------------------------------"

# small_board = "34--162--5-3-2--------6-6-2--545--21"
#
# pretty_board(board)
# p setup(small_board)
# pretty_board(setup(small_board))
# p sum_row(setup(small_board),0)
# p sum_column(setup(small_board),0)
# p sum_column(setup(small_board),1)
# p sum_column(setup(small_board),2)
# p row_solve?(setup(small_board))
# p column_solve?(setup(small_board))



# solved_board = solve(small_board)
# attempt = []
# attempt << solved_board
# until solved?(solved_board) == true
#   solved_board = solve(small_board)
#   solved?(solved_board)
#   if attempt.include?(solved_board) == true
#     next
#   else
#     attempt << solved_board
#   end
# end
# p attempt.length
# p pretty_board(solved_board)
board = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"

pretty_board(setup(board))
p board.length

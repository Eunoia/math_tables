require_relative '../lib/math_tables.rb'

describe Eratosthenes do
	describe "::primes" do
	  it 'generates all the primes under 100' do
	  	PRIMES_UNDER_100 = %w{ 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 }.map(&:to_i)
	  	primes = Eratosthenes.primes(100)
	  	expect(primes).to eq(PRIMES_UNDER_100)
		end
		it "generates primes below 1000" do
			PRIMES_UNDER_1000 = %w{ 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499 503 509 521 523 541 547 557 563 569 571 577 587 593 599 601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691 701 709 719 727 733 739 743 751 757 761 769 773 787 797 809 811 821 823 827 829 839 853 857 859 863 877 881 883 887 907 911 919 929 937 941 947 953 967 971 977 983 991 997 }.map(&:to_i)
			primes = Eratosthenes.primes(1000)
			expect(primes).to eq(PRIMES_UNDER_1000)
		end
	end
end

describe Table do
	describe '::cute_table' do
		context "when 10x10" do
			before do
				@x = (1..10).to_a
				@y = (1..10).to_a
				@table = Table.cute_table(@x, @y)
			end
			it 'has 12 column' do
				#12 column are for the header and underscore row
				expect(@table.scan(/\n/)).to eq(["\n"]*12)
			end
			it "ends in 100" do
				last_row = @table.split("\n")[-1]
				last_cell = last_row[/(\d\d+)\s+$/,1]
				expect(last_cell).to eq("100")
			end
			it "first row is numbers 1 though 10" do
				first_row = @table.split("\n")[0]
				joined_header = first_row.scan(/\d+/).join("")
				expect(joined_header).to eq(@x.join(""))
			end
			it "first column is numbers 1 though 10" do
				rows = @table.split("\n")
				first_column = rows.map{ |row| (row[/(\d+)\s+|/,1]||"").strip }
				joined_column = first_column.join("")
				expect(joined_column).to eq(@y.join(""))
			end
		end
		context "when primes 10x10" do
			before do
				@x = Eratosthenes.primes(30)
				@y = Eratosthenes.primes(30)
				@table = Table.cute_table(@x, @y)
			end
			it 'has 12 column' do
				#12 column are for the header and underscore row
				expect(@table.scan(/\n/)).to eq(["\n"]*12)
			end
			it "ends in 841" do
				last_row = @table.split("\n")[-1]
				last_cell = last_row[/(\d\d+)\s+$/,1]
				expect(last_cell).to eq("841")
			end
			it "first row is first 10 primes" do
				first_row = @table.split("\n")[0]
				joined_header = first_row.scan(/\d+/).join("")
				expect(joined_header).to eq(@x.join(""))
			end
			it "first column is first 10 primes" do
				rows = @table.split("\n")
				first_column = rows.map{ |row| (row[/(\d+)\s+|/,1]||"").strip }
				joined_column = first_column.join("")
				expect(joined_column).to eq(@y.join(""))
			end
		end
	end
end

class PalindController < ApplicationController
  	def input
  	end

  	def palind(n)
		mas = Array.new(n+1)
		mas[0] = 0
		for i in 11..n
			ik = i**2
			if ik.to_s == ik.to_s.reverse
				mas[i] = ik
				mas[0] += 1
				puts "Число #{i}, его квадрат #{mas[i]}"
			else
				mas[i]=nil
			end
		end
		return mas
 	end

  	def view
  		n1 = params[:n1].to_i
  		@result = palind(n1)
  	end
end

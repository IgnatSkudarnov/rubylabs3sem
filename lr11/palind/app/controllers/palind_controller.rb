class PalindController < ApplicationController
  def input
  end

  def view
    unless request.format == :xml
      @n1 = (buf = params[:n1].to_i).positive? ? buf : 0
      @result = Pali.get_palinds_by_key @n1

      unless @result
        @result = palind @n1
        new_palind = Pali.new do |palind|
          palind.key = @n1
          palind.palinds = {
            palinds: { type: 'Array', value: @result }
          }.to_json
        end

        new_palind.save
      end
    end

    respond_to do |format|
      format.html
      format.xml { render xml: Pali.all_palinds_hash_array }
    end
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
end

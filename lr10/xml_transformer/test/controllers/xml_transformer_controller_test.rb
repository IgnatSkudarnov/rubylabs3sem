require 'test_helper'

class XmlTransformerControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get xml_transformer_input_url
    assert_response :success
  end

  test 'should get answer html' do
    get '/palind/view', params: { format: 'html' }
    assert_response :success
  end

  test 'should get answer xml' do
    get '/palind/view', params: { format: 'xml' }
    assert_response :success
  end

  test 'result from first app shold be correct' do
    n1_value = rand(1000)
    page = Nokogiri::XML(open("http://localhost:3000/palind/view.xml?n1=#{n1_value}"))
    assert_equal palind(n1_value), page.at('result>value').elements.map { |el| el.children.text.to_i }
  end

  def palind(n)
	mas = Array.new(n+1)
	mas[0] = 0
	for i in 1..10
		mas[i]=0
	end
	for i in 11..n
		ik = i**2
		if ik.to_s == ik.to_s.reverse
			mas[i] = ik
			mas[0] += 1
			puts "Число #{i}, его квадрат #{mas[i]}"
		else
			mas[i]=0
		end
	end
	return mas
  end
end

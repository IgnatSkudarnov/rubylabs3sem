require 'test_helper'

class PaliTest < ActiveSupport::TestCase
  test 'should not save empty' do
    pali = Pali.new
    assert !pali.save
  end

  test 'should save and find data' do
    pali = Pali.new do |pali|
      pali.key = 4
      pali.palinds = { palinds: { type: 'Array', value: [2] } }.to_json
    end
    assert pali.save
    assert_equal [2], Pali.get_palinds_by_key(4)
  end

  test 'should not save data again' do
    pali = Pali.new do |pali|
      pali.key = 4
      pali.palinds = { palinds: { type: 'Array', value: [2] } }.to_json
    end

    assert pali.save

    pali_again = Pali.new do |pali|
      pali.key = 4
      pali.palinds = { palinds: { type: 'Array', value: [3] } }.to_json
    end

    assert !pali_again.save
  end
end

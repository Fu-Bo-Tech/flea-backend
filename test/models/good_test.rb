require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  test 'title' do
    plane = goods(:plane)
    assert plane.title == 'plane'
  end
end

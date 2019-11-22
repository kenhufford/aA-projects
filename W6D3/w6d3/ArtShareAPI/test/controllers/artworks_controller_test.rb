require 'test_helper'

class ArtworksControllerTest < ActionDispatch::IntegrationTest
  test "should get except:" do
    get artworks_except:_url
    assert_response :success
  end

  test "should get [edit," do
    get artworks_[edit,_url
    assert_response :success
  end

  test "should get new]" do
    get artworks_new]_url
    assert_response :success
  end

end

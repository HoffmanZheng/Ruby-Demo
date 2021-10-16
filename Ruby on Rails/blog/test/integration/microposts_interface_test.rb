require "test_helper"

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
  end

  test "micropost interface" do
    # test pagination in home page
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # test invalid micropost post request
    # assert_no_difference 'Micropost.count' do
    #   post microposts_path, params: { micropost: { content: " " } }
    # end
    # assert_select 'div#error_explanation'
    # assert_select 'a[href=?]', '/?page=2'  # 分页链接正确
    # valid post request
    content = "This micropost really ties the room together"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content} }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # delete a micropost
    assert_select 'a', text: 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # no delete button in another user's page
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end

require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup # ---> special function, automatically run before every test
    @base_title = "Ruby on Rails Tutorial Sample App"
    # extract the repetition in the code
  end

  test "should get root" do
    get root_url  # ???? FILL_IN
    assert_response :success
  end

  test "should get home" do
    get root_url
    assert_response :success
    # ---> test for the presence of a particular HTML tag
    # check for the presence of <title> containing the string
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end

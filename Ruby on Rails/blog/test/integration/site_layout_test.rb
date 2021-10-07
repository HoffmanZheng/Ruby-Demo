require "test_helper"

# integration test: ensure the link works on the page
# rule the thumb: only test elements which don't change often
class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout_links" do
    get root_path
    # check home page could render view correctly
    assert_template 'static_pages/home' 
    # check the specified link exists on the page
    # rails would replace the question mark with `path`
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
  end
end

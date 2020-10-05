require 'test_helper'

class PortfolioControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get portfolio_home_url
    assert_response :success
  end

  test "should get about" do
    get portfolio_about_url
    assert_response :success
  end

  test "should get resume" do
    get portfolio_resume_url
    assert_response :success
  end

  test "should get projects" do
    get portfolio_projects_url
    assert_response :success
  end

  test "should get contact" do
    get portfolio_contact_url
    assert_response :success
  end

end

require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  test "GET new" do
    get new_message_path
    assert_response :success

    assert_select 'form' do
      assert_select 'input[type=text]'
      assert_select 'input[type=email]'
      assert_select 'input[type=text]'
      assert_select 'textarea'
      assert_select 'input[type=submit]'
    end
  end

  test "POST create" do
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      post contact_path, params: {
        message: {
          name: 'cornholio',
          phone_number: '+919900000000',
          email: 'cornholio@example.org',
          body: 'hai'
        }
      }
    end
    assert_redirected_to new_message_path
    follow_redirect!
    assert_match /Message received, thanks!/, response.body
  end


  test "invalid POST create" do
    post contact_path, params: {
      message: { name: '', email: '', body: '', phone_number: '' }
    }
    assert_match /Name .* blank/, response.body
    assert_match /Email .* blank/, response.body
    assert_match /Body .* blank/, response.body
  end


end

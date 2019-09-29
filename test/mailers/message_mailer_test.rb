require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "contact_us" do
    message = Message.new name: 'Example User', email: 'user@example.com', body: 'hello, how are you'

    email = MessageMailer.contact_us(message)
    assert_emails 1 do
      email.deliver_now
    end
    assert_equal "Message from interested customer", email.subject
    assert_equal ["jankibeyond360@gmail.com"], email.to
    assert_equal ["user@example.com"], email.from
    assert_match "hello, how are you", email.body.encoded
  end

end

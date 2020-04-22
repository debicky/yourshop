require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "order_recived" do
    mail = OrderMailer.order_recived
    assert_equal "Order recived", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

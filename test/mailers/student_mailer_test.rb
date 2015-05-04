require 'test_helper'

class StudentMailerTest < ActionMailer::TestCase
  test "registration_successful" do
    mail = StudentMailer.registration_successful
    assert_equal "Registration successful", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

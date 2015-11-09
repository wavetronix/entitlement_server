require "test_helper"

feature "PasswordResets" do
  scenario "emails user when requesting password reset" do
    user = Factory(:user)
    # ActionMailer::Base.deliveries = ["cake", "pirates", "steak"]
    visit sign_in_path
    click_link "Forget your password"
    fill_in "Email", :with => user.email
    click_button "Next"
    page.must_have_content "sent password reset"
    last_email = ActionMailer::Base.deliveries.last
    raise ActionMailer::Base.deliveries.last
    # expect(last_email.to).to eq [user.first_name]
    # assert_equal user.email, last_email['to'] #this works, it's just empty cuz there is nothing to anything
  end
end

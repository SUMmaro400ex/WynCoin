require 'rails_helper'

feature 'Log In To Business Account', type: :feature do
  let!(:password) { Faker::Internet.password }
  let(:account) { create :account, password: password }
  context 'business visits login page' do
    before do
      visit login_path
    end

    it "and sees login form" do
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
    end
    context 'and submits form' do
      before do
        fill_in "Email", with: account.email
        fill_in "Password", with: password
        choose('Business Account')
        click_button('Sign In')
      end

      it "Displays the profile page" do
        expect(page).to have_content(account.api_token)
      end


    end
  end
end

require 'rails_helper'

feature 'Create An Account', type: :feature do
  let!(:password) { Faker::Internet.password }
  let(:account) { build :account, password: password }
  context 'business visits register page' do
    before do
      visit new_account_path
    end

    it "Displays a registration form" do
      expect(page).to have_field("Company name")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
    end
    context 'and submits form' do
      before do
        fill_in "Company name", with: account.company_name
        fill_in "Email", with: account.email
        fill_in "Password", with: password
        fill_in "Bitcoin address", with: account.bitcoin_address
        click_button('Create Account')
      end

      it "Displays the profile page" do
        expect(page).to have_content(Account.find_by_email(account.email).api_token)
      end


    end
  end
end

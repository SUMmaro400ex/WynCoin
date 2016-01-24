require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :company_name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_company_name[name=?]", "account[company_name]"

      assert_select "input#account_email[name=?]", "account[email]"
    end
  end
end

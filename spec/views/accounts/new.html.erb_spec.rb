require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :company_name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_company_name[name=?]", "account[company_name]"

      assert_select "input#account_email[name=?]", "account[email]"
    end
  end
end

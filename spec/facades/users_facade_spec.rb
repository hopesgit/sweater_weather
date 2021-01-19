require 'rails_helper'

describe UsersFacade, type: :class do
  describe 'class methods' do
    describe '.create_user' do
      before :each do
        User.destroy_all
      end

      it 'expect missing confirm to fail' do
        expect {UsersFacade.create_user({email: "heck@wot.com", password: "double wot"})}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'expect missing password to fail' do
        expect {UsersFacade.create_user({email: "heck@wot.com", password_confirmation: "double wot"})}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'expect missing email to fail' do
        expect {UsersFacade.create_user({password: "double wot", password_confirmation: "double wot"})}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'can create a user' do
        UsersFacade.create_user({email: "heck@wot.com", password: "double wot", password_confirmation: "double wot"})

        last_user = User.last
        expect(last_user.email).to eq("heck@wot.com")
        expect(last_user.authenticate("double wot")).to be_truthy
        expect(last_user.api_key).to be_a String
        expect(last_user.api_key).to_not be_empty
      end
    end
  end
end

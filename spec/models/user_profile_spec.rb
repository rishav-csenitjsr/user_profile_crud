require 'rails_helper'

RSpec.describe UserProfile, type: :model do

  describe 'Signup Page' do
    context 'Password with' do
        it 'Only digits' do
            @user = FactoryGirl.build(:user_profile, password: "12345678")
            @user.valid?
            expect(@user.errors.messages[:password]).to include(" must contain at least one lowercase letter", " must contain at least one uppercase letter")
        end

        it 'Only Uppercase letters' do
          @user = FactoryGirl.build(:user_profile, password: "ABCDEFGH")
          @user.valid?
          expect(@user.errors.messages[:password]).to include(" must contain at least one lowercase letter", " must contain at least one digit")
        end

        it 'Only Lowercase letters' do
          @user = FactoryGirl.build(:user_profile, password: "abcdefgh")
          @user.valid?
          expect(@user.errors.messages[:password]).to include(" must contain at least one uppercase letter", " must contain at least one digit")
        end

        it 'only special characters' do
            @user = FactoryGirl.build(:user_profile, password: "@@@^&^&^")
            @user.valid?
            expect(@user.errors.messages[:password]).to include(" must contain at least one lowercase letter", " must contain at least one uppercase letter", " must contain at least one digit")
        end

        it 'no digit' do
            @user = FactoryGirl.build(:user_profile, password: "ABCDefgh")
            @user.valid?
            expect(@user.errors.messages[:password]).to include(" must contain at least one digit")
        end

        it 'insufficient characters' do
            @user = FactoryGirl.build(:user_profile, password: "a1Aa1Aa")
            @user.valid?
            expect(@user.errors.messages[:password]).to include("is too short (minimum is 8 characters)")
        end    
    end

    context 'Firstname, Lastname, phone number, Email Constraints' do
        it 'empty firstname' do
            @user = FactoryGirl.build(:user_profile, first_name: "")
            @user.valid?
            expect(@user.errors.messages[:first_name]).to include("can't be blank")
        end

        it 'empty Lastname' do
          @user = FactoryGirl.build(:user_profile, last_name: "")
          @user.valid?
          expect(@user.errors.messages[:last_name]).to include("can't be blank")
        end

        it 'empty phone number' do
          @user = FactoryGirl.build(:user_profile, phone_number: "")
          @user.valid?
          expect(@user.errors.messages[:phone_number]).to include("can't be blank")
        end

        it 'should not allow Multiple users with same email' do
          @user = FactoryGirl.create(:user_profile)
          @user.valid?
          @other_user = FactoryGirl.build(:user_profile, email: "rishavk@gmail.com")
          @other_user.valid?
          expect(@other_user.errors.messages[:email]).to include("has already been taken")
      end
    end

    it 'should allow to create multiple Users' do
        @user = FactoryGirl.create(:user_profile)
        @user.valid?
        @other_user = FactoryGirl.create(:user_profile, email: "rishavkumar@gmail.com")
        @other_user.valid?
        expect(UserProfile.count).to eql(2)
    end
  end
end

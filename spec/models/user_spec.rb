require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    end
  
    context "ユーザーが新規登録ができる場合" do
      it "全ての情報が適切に入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
  
    #異常系
    context "ユーザーが新規登録できない場合" do

      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "すでに登録されているemailは利用できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "@が無いemailは登録できない" do
        @user.email ="abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password =""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは6文字以上でないと登録できない" do
        @user.password = "abcde"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは6文字以上128字以下でないと登録できない" do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名前（name_first_name）が空だと登録できない" do
        @user.name_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first name can't be blank")
      end
      it "名前カナ（name_first_name_kana）が空だと登録できない" do
        @user.name_first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first name kana can't be blank")
      end

      it "名字（name_last_name)が空だと登録できない" do
        @user.name_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last name can't be blank")
      end
      it "名字カナ（name_last_name_kana)が空だと登録できない" do
        @user.name_last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last name kana can't be blank")
      end
      it "名字（name_last_name)が全角文字以外だと登録できない" do
        @user.name_last_name ="sample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last name is invalid")
      end
      it "名前（name_first_name)が全角文字以外だと登録できない" do
        @user.name_first_name ="sample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first name is invalid")
      end
      it "名前カナ（name_first_name_kana）がカタカナ以外だと登録できない" do
        @user.name_first_name_kana ="kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first name kana is invalid")
      end
      it "名字カナ（name_last_name_kana）がカタカナ以外だと登録できない" do
        @user.name_last_name_kana ="kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last name kana is invalid")
      end
      it "passwordが半角英字のみの場合は登録できない" do
        @user.password ="passwordsample"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみの場合は登録できない" do
        @user.password = "12345678"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに全角文字が入ると登録できない"do
        @user.password="123passwordサンプル"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "scool_idが空だと購入（保存）できない" do
        @user.school_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("School can't be blank")
      end
      it "教室名の選択においてid:1(---)を選択すると購入できない" do
        @user.school_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("School can't be blank")
      end
      it "grade_idが空だと購入（保存）できない" do
        @user.grade_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Grade can't be blank")
      end
      it "学年の選択においてid:1(---)を選択すると購入できない" do
        @user.grade_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Grade can't be blank")
      end
      it "class_idが空だと購入（保存）できない" do
        @user.class_id = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Class can't be blank")
      end
      it "組の選択においてid:1(---)を選択すると購入できない" do
        @user.class_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Class can't be blank")
      end
      it "group_idが空だと購入（保存）できない" do
        @user.group_id = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Group can't be blank")
      end
    end
end

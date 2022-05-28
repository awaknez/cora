require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "申し込み情報の登録" do

    before do
      @reservation = FactoryBot.build(:reservation)
    end

    context "申し込みができる場合" do
      it "全ての情報が入力されていれば購入できる" do
          expect(@reservation).to be_valid
      end
      it "質問（question)が空でも購入できる" do
          @reservation.question = ""
          expect(@reservation).to be_valid
      end
    end

    context "申し込みできない（問題がある）場合" do
      it "日付が空だと申し込みできない" do
        @reservation.date = ""
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Date can't be blank")
      end
      it "時間が空だと申し込みできない" do
        @reservation.time = ""
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Time can't be blank")
      end
      it "開始時間が空だと申し込みできない" do
        @reservation.start_time = ""
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Start time can't be blank")
      end
      it "形式が空だと申し込みできない" do
        @reservation.style_id = ""
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Style can't be blank")
      end
      it "参加人数が空だと申し込みできない" do
        @reservation.number_of_people_id = ""
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Number of people can't be blank")
      end
      it "ユーザーが紐づいていないと申し込みできない" do
        @reservation.user = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("User must exist")
      end
      it "面談形式の選択においてid:1(---)を選択すると申し込みできない" do
        @reservation.style_id = "1"
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include ("Style を選んでください")
      end
      it "参加人数の選択においてid:1(---)を選択すると申し込みできない" do
        @reservation.number_of_people_id = "1"
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include ("Number of people を選んでください")
      end
    end

  end
end
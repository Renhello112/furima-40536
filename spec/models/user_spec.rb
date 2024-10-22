require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it '英字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '全角文字が含まれていると登録できないこと' do
        @user.password = 'ａｂｃ123'
        @user.password_confirmation = 'ａｂｃ123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')

        it '姓（全角）が空だと登録できない' do
          @user.given_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name 全角文字を入力してください')
        end

        it '名（全角）に半角文字が含まれていると登録できない' do
          @user.first_name = 'Taro' # 半角英字を含む名を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 全角文字を入力してください')
        end

        it '姓（カナ）が空だと登録できない' do
          @user.last_name_reading = '' # 姓（カナ）を空に設定
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name reading を入力してください')
        end

        it '姓（カナ）にカタカナ以外の文字（平仮名）が含まれていると登録できない' do
          @user.last_name_reading = 'たろう' # 平仮名を含む姓（カナ）を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name reading 全角カタカナを入力してください')
        end

        it '姓（カナ）にカタカナ以外の文字（漢字）が含まれていると登録できない' do
          @user.last_name_reading = '太郎' # 漢字を含む姓（カナ）を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name reading 全角カタカナを入力してください')
        end

        it '姓（カナ）にカタカナ以外の文字（英数字）が含まれていると登録できない' do
          @user.last_name_reading = 'Taro123' # 英数字を含む姓（カナ）を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name reading 全角カタカナを入力してください')
        end

        it '姓（カナ）にカタカナ以外の文字（記号）が含まれていると登録できない' do
          @user.last_name_reading = 'タロウ@' # 記号を含む姓（カナ）を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name reading 全角カタカナを入力してください')
        end

        it '名（カナ）が空だと登録できない' do
          @user.first_name_reading = '' # 名（カナ）を空に設定
          @user.valid?
          expect(@user.errors.full_messages).to include('First name reading を入力してください')
        end

        it '名（カナ）にカタカナ以外の文字（平仮名）が含まれていると登録できない' do
          @user.first_name_reading = 'たろう' # 平仮名を含む名（カナ）を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('First name reading 全角カタカナを入力してください')
        end

        it '名（カナ）にカタカナ以外の文字（漢字）が含まれていると登録できない' do
          @user.first_name_reading = '太郎' # 漢字を含む名（カナ）を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('First name reading 全角カタカナを入力してください')
        end

        it '名（カナ）にカタカナ以外の文字（英数字）が含まれていると登録できない' do
          @user.first_name_reading = 'Taro123' # 英数字を含む名（カナ）を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('First name reading 全角カタカナを入力してください')
        end

        it '名（カナ）にカタカナ以外の文字（記号）が含まれていると登録できない' do
          @user.first_name_reading = 'タロウ@' # 記号を含む名（カナ）を設定
          @user.valid?
          expect(@user.errors.full_messages).to include('First name reading 全角カタカナを入力してください')
        end

        it '生年月日が空だと登録できない' do
          @user.birth_date = '' # 生年月日を空に設定
          @user.valid?
          expect(@user.errors.full_messages).to include('Birth date を入力してください')
        end
      end
    end
  end
end

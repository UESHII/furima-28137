require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do

    context 'ユーザー登録がうまくいくとき' do
      it 'nickname, email, password, password_confirmation, family_name, first_name, kana_family_name, kana_first_name, birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれており、かつ@の前後に空白と@以外の文字があれば登録できる' do
        @user.email = "a@z"
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ英数字混合であれば登録できる' do
        @user.password = "12345a"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.password_confirmation = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Password can't be blank",
          "Password is invalid. Input 6 characters at least, use both of letter and number.",
          "Password confirmation doesn't match Password"
        )
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Family name can't be blank",
          "Family name is invalid. Input full-width characters."
        )
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "First name can't be blank",
          "First name is invalid. Input full-width characters."
        )
      end
      it 'kana_family_nameが空だと登録できない' do
        @user.kana_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Kana family name can't be blank",
          "Kana family name is invalid. Input full-width characters."
        )
      end
      it 'kana_first_nameが空だと登録できない' do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Kana first name can't be blank",
          "Kana first name is invalid. Input full-width characters."
        )
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailに＠が含まれていないと登録できない' do
        @user.email = "exampleexample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが6文字未満では登録できない' do
        @user.password = "123ab"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英字のみだとユーザー登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input 6 characters at least, use both of letter and number.")
      end
      it 'passwordが数字のみだとユーザー登録できない' do
        @user.password = "000000"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input 6 characters at least, use both of letter and number.")
      end
      it 'family_nameが半角だと登録できない' do
        @user.family_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it 'kana_family_nameが半角だと登録できない' do
        @user.kana_family_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name is invalid. Input full-width characters.")
      end
      it 'kana_first_nameが半角だと登録できない' do
        @user.kana_first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width characters.")
      end
    end

  end
end
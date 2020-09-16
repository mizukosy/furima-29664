class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :password, :password_check, :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  validates :email.mach(/@.t/)

  PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/
  validates :password, presence: true,format: { with: PASSWORD_REGEX,message: "は半角6文字以上の半角英数字"}
  
  with_options presence: true, format: { with: [/\A[あ-んア-ン一-龥]/,message:"全角文字をしようしてください"]} do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ぁ-ん]+\z/, message: 'ひらがなを使用してください' } do
      validates :first_name_kana
      validates :last_name_kana
  end

end

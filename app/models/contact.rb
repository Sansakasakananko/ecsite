class Contact < ApplicationRecord
  validates :name, presence: { message: "名前が空欄です。" }
  validates :email, presence: { message: "メールアドレスが空欄です。" }
  validates :message, presence: { message: "メッセージが空欄です。" }
end

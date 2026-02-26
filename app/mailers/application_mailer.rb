class ApplicationMailer < ActionMailer::Base
  default from: "user@realdomain.com" # ← ここをテストと同じアドレスにする
  layout "mailer"
end
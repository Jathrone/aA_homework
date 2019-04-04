class UserMailer < ApplicationMailer
    default from: 'example@appacademy.io'

    def welcome_email(user)
        @user = user
        mail(to: 'testto@test.io', from: 'everybody@appacademy.io', subject: "you rock!")
    end
end

class RestaurantMailer < ApplicationMailer
  default from: "instantlunch@instantlunch.pl"

  def restaurant_email(user)
    @user = user
    mail(to: @user.email, subject: 'Subskrypcja InstantLunch')
  end

end

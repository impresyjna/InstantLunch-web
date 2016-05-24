class RestaurantMailer < ApplicationMailer
  default from: "instantlunch@instantlunch.pl"

  def restaurant_email(user, restaurant)
    @user = user
    @restaurant = restaurant
    mail(to: @user.email, subject: 'Subskrypcja InstantLunch')
  end

end

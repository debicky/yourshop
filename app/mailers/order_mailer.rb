class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_recived.subject
  #
  def order_recived(checkout)
    @checkout = checkout

    mail to: checkout.email, subject: "Your order confirmation"
  end
end

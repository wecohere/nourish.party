# Contributions made by a supporter to a project
class Contribution
  include ActiveModel::Model

  attr_reader :amount_in_dollars
  attr_writer :payment_processor
  attr_accessor :amount_cents

  def create
    payment_processor.charge(amount: amount)
  end

  def amount_in_dollars=(amount_in_dollars)
    (self.amount_cents = amount_in_dollars.to_f * 100) && return if amount_in_dollars.respond_to?(:to_f)
    raise ArgumentError, "amount_in_dollars must respond to #to_f, but is a #{amount_in_dollars.class}"
  end

  def payment_processor_attributes=(params)
    params.each do |key, value|
      payment_processor.send("#{key}=", value)
    end
  end

  private def amount
    Money.new(amount_cents, "USD")
  end

  def payment_processor
    @payment_processor ||= StripePaymentProcessor.new
  end
end

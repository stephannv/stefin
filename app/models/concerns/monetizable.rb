module Monetizable
  def monetize(attribute)
    define_method attribute do
      cents = public_send("#{attribute}_cents")
      currency = public_send("#{attribute}_currency")

      Money.new(cents, currency)
    end
  end
end

defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount / 100.0 * discount)
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(daily_rate(hourly_rate) * 22, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    days = budget / apply_discount(daily_rate(hourly_rate), discount)
    trunc(days * 10) / 10
  end
end

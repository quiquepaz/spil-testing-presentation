# language:en
Feature: Payment Method Count
  As a user, I want to see a certain number of payment methods
  for my country.

  Scenario Outline: Payment Method Choice
    Given I am a user in "<Country>"
    And I open the PSS
    Then I should see "<PaymentMethodCount>" payment methods
    Examples:
      | Country | PaymentMethodCount |
      | Poland  | 6                  |
      | France  | 5                  |
      | Brazil  | 6                  |

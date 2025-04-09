Feature: Confirm Booking

Background:
    Given John has selected prefer payment method

Scenario: Viewing booking success page for confirm booking
    When John made a payment for the available seat
    And the payment process was successful 
    Then he should see the booking confirmation page with detailed information
    And he should receive confirmation SMS in his provided phone number
    And he should receive confirmation E-mail if he filled E-mail in traveler information

Scenario: Payment was successful, but the booking was not confirmed
    When John made a payment for the available seat
    And the payment process was successful
    But another user has already booked that seat during John's long booking process (over 10 minutes)
    Then he should see a message indicating payment was successful but booking was not confirmed
    And the system should provide contact information for further support in alert message

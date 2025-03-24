Feature: Traveller Info Collection

Background:
    Given John has reserved a seat
    And he can see the travel form

Scenario: Default fields in traveller info form
    When the traveller form is loaded
    Then John should see the following fields with their default values
      | Field           | Required/Optional | Initial Value |
      | Traveller Name  | Required          |               |
      | Gender          | Required          |               |
      | Phone Number    | Required          |               |
      | Email           | Optional          |               |
      | Special Request | Optional          |               |
    And John should see the trip summary along side the form
    And the trip summary must show the selected seats numbers and the subtotal

Scenario: Name field validation for maximum length limit
    Given John has entered the name longer than 50 characters                         |
    When John submits the form
    Then he should see an error message saying that the traveller name is invalid
    And the form should not be submitted

Scenario: Phone Number field validation for maximum length limit
    Given John has entered the phone number shorter than 9 digits or longer than 11 digits
    When John submits the form
    Then he should see an error message saying that the phone number is invalid
    And the form should not be submitted



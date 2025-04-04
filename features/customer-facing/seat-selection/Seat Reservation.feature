Feature: Seat Reservation

Background:
  Given John has made a search
  And he has reviewed the results
  And he has selected a trip 
  And the seat plan is loaded


Scenario: Showing seat plan details
    When John reviews the seat plan
    Then all seats should be displayed
    And available and unavailable seats should be clearly distinguishable
    And the available seats should be selectable
    And the unavailable seats should not be selectable
    And the trip summary should clearly show the selected trip details


Scenario: Select a single seat  
    Given John has not make any seat selection
    When John select a single available seat
    Then the selected seat should be highlighted on the seat plan
    And the seat details should be displayed in trip summary section
    And the button to reserve the seats and go to next step should be active

    Given John has selected a seat
    And the trip requires John to select a seat
    When John select another available seat
    Then the available seat cannot be selected

    Given John has selected a seat
    When John deselects the selected seat
    Then the deselected seat should no longer be highlighted and look available again
    And the seat details should disappear in trip summary section
    And the button to reserve the seats and go to the next step should be inactive


Scenario: Select multiple seats  
    Given John has not make any seat selection
    And the trip requires John to select two seats
    When John select a single available seat
    Then the selected seat should be highlighted on the seat plan
    And the seat details should be displayed in trip summary section
    And the button to reserve the seats and go to next step should remain in-active

    Given John has selected a seat
    And the trip requires John to select two seats
    When John select another available seat
    Then the selected seat should be highlighted on the seat plan
    And there are two highlighted seats on the seat plan
    And the seat details for two seats should be displayed in trip summary section
    And the button to reserve the seats and go to the next step should become active

    Given John has selected two seats
    And the trip requires John to select two seats
    When John try to select another available seat
    Then the available seat cannot be selected

    Given John has selected two seats
    And the trip requires John to select two seats
    When John deselects a selected seat
    Then the deselected seat should no longer be highlighted and look available again
    And there is still one highlighted seat on the seat plan
    And the seat details for the selected seats still should be displayed in trip summary section
    And the button to reserve and go to the next step should be inactive


  


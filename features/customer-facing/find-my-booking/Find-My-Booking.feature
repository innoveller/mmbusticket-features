Feature: MMBusTicket website Find My Booking

    Background:
        Given John is on the home page of MMBusTicket website
        And John has made a complete booking

    Scenario: Viewing Find My Booking page
        Given John navigates to the find my booking Feature
        Then he should see the website's logo
        And he should see the top navigation links to "Home", "Print Your Ticket", "Help", "FAQ" and "Language" option
        And he should see booking search form
        And he should see the footer

    Scenario: Default values on the booking search form fields
        Given John is on the find my booking page
        Then he should see the booking search form with mendatory fields and "Retrieve Booking" button
        And "From", "To", "Departure Date" and "Phone Number" fields should be empty
        

    Scenario: Find booking with missing required field
        Given John is on the find my booking page
        And he has entered all required fields except for "(Field)"
        When John clicks the Retrieve Booking button
        Then he should see a warning message indicating that "(Field)" is required.
        Examples:
            | Field          |
            | From           |
            | To             |
            | Departure Date |
            | Phone Number   |

    Scenario: Find booking with search data, where the user used different data during booking
        Given John is on the find my booking page
        And he has entered all required fields but invalid input for "(Field)"
        When John clicks the Retrieve Booking button
        Then he should see the message indicating there is no booking for search criteria
        Examples:
            | Field          |
            | From           |
            | To             |
            | Departure Date |
            | Phone Number   |

    Scenario: Find booking with valid inputs
        Given John is on the find my booking page
        And he has entered all required fields with valid inputs according to his completed booking
        When he clicks the Retrieve Booking button
        Then he should see the booking(s) list he has done with the information:
            | Route               |
            | Departure Time      |
            | Bus Operator        |
            | Number of Seats     |
            | Total               |
            | View Details button |

    Scenario: Clicking View Details button
        Given John has searched his booking by providing all required fields with valid inputs
        And the system displays the booking list
        When John clicks on the View Details button of a booking
        Then he should be navigated to Confirm page of that booking ID
        
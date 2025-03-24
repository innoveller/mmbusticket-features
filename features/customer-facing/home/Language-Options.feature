Feature: Language Options

  Scenario: Viewing the Website in Default Language
    Given John is on the home page
    Then the website should be displayed in the default language, English
    And all text on the page should be in English

  Scenario: Viewing the Language Dropdown Menu
    Given John is on the home page
    Then he should see a language dropdown menu at the top of the page
    And the dropdown menu should include options for "English" and "Myanmar"

  Scenario: Changing the Website Language
    Given John is on the home page
    When he selects "Myanmar" from the language dropdown menu
    Then the website should reload in Myanmar
    And all text should be in Myanmar

  Scenario: Remembering User's Language Preference
    Given John has changed the website language to Myanmar
    When he navigates away from the website and returns later
    Then the website should remember his language preference
    And the website should be displayed in Myanmar

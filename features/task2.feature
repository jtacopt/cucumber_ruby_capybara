Feature: Verify that the filters in SRP are working properly

  Background: The user is already in used Cars Frame
    Given The user accept the cookies
    And The user populate the Location as bellow
      | State           | Postal Code | Purpose |
      | South Australia | 5006        | Private |

  Scenario: Cenas
    Given Start Test
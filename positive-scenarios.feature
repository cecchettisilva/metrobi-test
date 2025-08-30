# ================================
# Positive:
# This scenario demonstrates how is the part of create a new delivery.
# ================================

Feature: Create delivery
    As a Metrobi user
    I want to create a new delivery
    So I can manage deliveries

Background:
 	Given I am logged in as an authorized user
    And I am on the Metrobi dashboard

Scenario: Create a new delivery using the "Request a driver" option without selecting a driver
	When I create a new delivery with "Request a driver" option
    And I fill "WILLIAM CECCHETTI" in the Pickup location
    And I click the "Add pickup stop" button
    And I enter the following delivery details:
        | Field               | Value                                   |
        | Pickup location     | WILLIAM CECCHETTI                       |
        | Pickup date         | Aug 29 2025                             |
        | Pickup time         | 06:00 PM - 08:00 PM                     |
        | Pickup flexibility  | Flexible arrival                        |
        | Vehicle type        | Medium                                  |
        | Add job description | Please be careful with fragile products |
	And I click the "Request a driver" button
    Then I should be on the Delivery details page
    And the message "Great! Your delivery was created!" should be displayed
    And I click the "Add stop" button
    And I search for the location "Paul Mitchell The School Fresno" 
    And I add a delivery stop following the details:
        | Field        | Value        |
        | Phone Number | 555-555-5555 |
    And I click the "Add stop" button
	Then the message "Brilliant! The new stop has been successfully added to your delivery route" should be displayed
    And the delivery stop "1 - Paul Mitchell The School Fresno" should appear in the route details list
    And the delivery price "$148.58" is filled
    And the route should being tracked in the map section

# ================================
# Improvement:
# The "Delivery details" and "My deliveries" pages need improvement because there is no explicit button to cancel a delivery.
# ================================
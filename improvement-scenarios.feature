# ================================
# Improvement 1:
# This scenario needs improvement because the success message shows "Great! Location has been created."
# The correct message should be "Great! Customer has been created." to match the actual action.
# ================================

Feature: Customer Management
    As a Metrobi user
    I want to add a new customer
    So I can manage deliveries

Background:
 	Given I am logged in as an authorized user
    And I am on the Metrobi dashboard

Scenario: Add a new customer successfully
    When I access the "Customers" page 
	And I click the "Add customer" button
    And I enter the following customer details:
        | Field                 | Value                              |
        | Recipient name        | Chef Paul's Cafe                   |
        | Address               | 952 F St, Fresno, CA 93706, USA    |
        | Email address         | will@metrobi.com                   |
        | Phone number          | 499-119-0606                       |
        | Add business name     | Chef Paul's Cafe                   |
        | Delivery instructions | Deliver only to Paul               |
	And I click the "Add customer" button
	Then the message "Great! Location has been created." should be displayed
    And the customer "Chef Paul's Cafe" should appear in the customers list

# ================================
# Improvement 2
# It's not possible to delete the customer before creating it.
# The necessary improvement is to add a "Delete" button on the Customers page for each added customer.
# ================================
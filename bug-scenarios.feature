# ================================
# Bug 1:
# When returning to the "Delivery details" page, the system logs out and the browser console shows the following errors:

#"🤕 Uh-Oh!
#'NoneType' object has no attribute 'lat' Error ID: <ID>"

# main.adf324cf.js:2 [2025-08-29T21:49:15.668Z]  @firebase/firestore: Firestore (10.14.1): Uncaught Error in snapshot listener: FirebaseError: [code=permission-denied]: Missing or insufficient permissions.

# main.adf324cf.js:2 
#  POST https://<LINK>/anon/estimate?recaptchatoken=<TOKEN> 500 (Internal Server Error)
# 18
# [Report Only] Refused to load the font '<URL>' because it violates the following Content Security Policy directive: "default-src 'self'". 
#Note that 'font-src' was not explicitly set, so 'default-src' is used as a fallback.

# ================================

Feature: Create delivery management
    As a Metrobi user
    I want to create a new delivery
    So I can manage deliveries

Background:
 	Given I am logged in as an authorized user
    And I am on the Metrobi dashboard

Scenario: Access the "Copy quote link" on the delivery
	When I access the "My Deliveries" page 
    And I access a delivery in progress 
    Then I should be on the "Delivery details" page
	When I click the "icon-dots-vertical" button
    And I click the "Copy quote link" button
    And I open the copied link in a new browser tab
    Then the "Add payment method" page should be displayed
    When I return to the "My Deliveries" browser tab
    Then the "Delivery details" page should be displayed

# ================================
# Bug 2:
# When an emergency contact is added to a delivery, the system accepts the action but the contact is not displayed on the "Delivery details" page.
# The expected behavior is that the added emergency contact should be displayed somewhere on the delivery details page.
# ================================

Scenario: Add an emergency contact to the delivery
	When I access the "My Deliveries" page 
    And I access a delivery in progress 
    Then I should be on the "Delivery details" page
	When I click the "icon-dots-vertical" button
    And I click the "Add emergency contact" button
    Then I select an emergency contact from the list 
    And I click the "Add" button
    Then the emergency contact should be displayed on the "Delivery details" page
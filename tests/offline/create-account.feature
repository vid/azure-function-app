
Feature: Authentication using email address

Backgrounds: service/powerapps
  When I open the powerapps page
  And I click on Get started
  Then I should be on the ExternalSignIn page

  When I click the button Email Login
  Then the URI should start with https://digitalgc.b2clogin.com/

  When I click the button Sign up now
  Then the URI should match CombinedSigninAndSignup
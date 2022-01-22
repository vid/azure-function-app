  On the AccountHome webpage
  When I click the button AccountMenuProfile
  Then the URI should start with AccountProfile
  
  On the AccountProfile webpage
  When I click the button //*[@id="btn-cancel"]
  Then the URI should start with AccountHome
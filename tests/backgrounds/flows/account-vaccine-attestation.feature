  On the AccountHome webpage
  When I click the button AccountMenuVaccineAttestation
  # needs to wait for va-new to va-privacy redirect
  pause for 2s 
  Then the URI should start with AccountVaccineAttestation
  
  On the AccountVaccineAttestation webpage
  When I click the button //*[@id="btn-submit"]
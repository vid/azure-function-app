Self Testing Step 4b (JS Dialog).
  Save URI query parameter attid to attestationId
  And the URI should include attid
  Then the URI query parameter attid is attestationId
  
  Accept next dialog to clicked
  Concat AccountSelfTestingScreeningResults and ?attid= as xssSegmentWithAttestationIdKey
  Concat xssSegmentWithAttestationIdKey and attestationId as xssSegmentWithAttestationIdKeyAndValue
  Concat xssSegmentWithAttestationIdKeyAndValue and &kit=754410000 as xss
 
  On the xss webpage
  Dialog "clicked" message not set

  Concat xss and );alert(123456);//test as exploit
  On the exploit webpage
  Dialog "clicked" message not set

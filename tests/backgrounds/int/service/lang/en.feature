Set PowerAppsHome to https://workplace.alpha.canada.ca/en/
Set Home to https://workplace.alpha.canada.ca/en/
Set ExternalSignIn URI to https://workplace.alpha.canada.ca/en/SignIn?ReturnUrl=%2Fen%2Findex%2F
Set Get Started to :text("Get started")
Set Language Name to "English"
Set Language Selected to //*[@data-code="en"]
Set SignInMenu to :text("Sign in")
Set Email Login to :text("Testing Purposes Only")
Set AccountHome to https://workplace.alpha.canada.ca/en/index/
Set SignOutMenu to :text("Sign out")

Set AccountProfile to https://workplace.alpha.canada.ca/en/contact-details-du-contact/
Set AccountSelfTestingWorksite to https://workplace.alpha.canada.ca/en/self-test-worksite-site-de-travail-depistage/
Set AccountSelfTestingScreeningKit to https://workplace.alpha.canada.ca/en/self-test-kit-trousse-depistage/
Set AccountSelfTestingScreeningResults to https://workplace.alpha.canada.ca/en/self-test-results-resultats-depistage/
Set AccountSelfTestingScreeningAttestation to https://workplace.alpha.canada.ca/en/self-test-attestation-depistage/
Set AccountSelfTestingScreeningReview to https://workplace.alpha.canada.ca/en/self-test-review-revue-depistage/
Set AccountSelfTestingScreeningAnalysis to https://workplace.alpha.canada.ca/en/self-test-analysis-analyse-depistage/
Set AccountVaccineAttestation to https://workplace.alpha.canada.ca/en/va-privacy/

Set AccountMenuProfile to :text('My Profile') >> visible=true
Set AccountMenuSelfTesting to :text('Self Testing') >> visible=true
Set AccountMenuVaccineAttestation to .home-btn:near(:text("Vaccine attestation"), 100)
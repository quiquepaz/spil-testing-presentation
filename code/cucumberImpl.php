    /** @Given /^I am a user in "([^"]*)"$/ */
    public function iAmAUserIn($country)
    {
        $country = strtolower($country);
        $this->session->setRequestHeader('SPILTESTIPADDRESS', SpilTestIP::addressFor($country));
    }
    /** @Given /^I open the PSS$/ */
    public function iOpenThePss()
    {
        return $this->iOpenThePaymentSelectionScreen();
    }
    /** @Then /^I should see "([^"]*)" payment methods$/ */
    public function iShouldSeePaymentMethods($nummethods)
    {
        $page = $this->session->getPage();
        $el = $this->getDomNodeByXpath($page, '//*[@id="pss_method_collection"]');
        $foundmethods = count($el->findAll('css', 'div.pss_method'));
        if ($nummethods != $foundmethods) {
            throw new Exception("Found payment methods does not equal $nummethods");
        }
    }

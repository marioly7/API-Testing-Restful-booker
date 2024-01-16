package runner;

import factoryRequest.FactoryRequest;
import config.Configuration;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import factoryRequest.RequestInformation;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

public class BookingCrudSteps {

    Response response;
    RequestInformation requestInformation = new RequestInformation();
    Map<String, String> variables = new HashMap<>();
    Configuration configuration = new Configuration();

    @Given("I require authentication")
    public void iRequireAuthentication() {
        String credentials = Base64.getEncoder()
                .encodeToString((configuration.username+":"+Configuration.password).getBytes());

        System.out.println("Credentials: "+credentials);

        requestInformation.setUrl(Configuration.host)
                .setHeaders("Authorization","Basic "+credentials);
    }

    @Given("I don't require authentication")
    public void iDontRequireAuthentication() {
        requestInformation = new RequestInformation();
    }

    @When("I send a {} request to url {string} with the following body")
    public void iSendAPOSTRequestToUrlWithTheFollowingBody(String method, String url, String body) {
        requestInformation.setUrl(Configuration.host + replaceValues(url));
        requestInformation.setBody(body);
        requestInformation.setHeaders("Content-Type", "application/json");
        response = FactoryRequest.make(method).send(requestInformation);
    }

    @Then("the response status should be {int}")
    public void theResponseStatusShouldBe(int expectedCode) {
        response.then().statusCode(expectedCode);
    }

    @And("the attribute {string} should be {string}")
    public void theAttributeShouldBe(String attribute, String expectedValue) {
        response.then().contentType("application/json").body(attribute, equalTo(expectedValue));
    }

    private String replaceValues(String value){
        for (String key: variables.keySet()){
            value = value.replace(key, variables.get(key));
        }
        return value;
    }

    @And("the attribute {string} should be {int}")
    public void theAttributeShouldBe(String attribute, int expectedValue) {
        response.then().contentType("application/json").body(attribute, equalTo(expectedValue));
    }

    @And("the attribute {string} should be true")
    public void theAttributeShouldBeTrue(String attribute) {
        response.then().contentType("application/json").body(attribute, equalTo(true));
    }

    @And("save the {string} attribute in the variable {string}")
    public void saveTheAttributeInTheVariable(String attribute, String variableName) {
        variables.put(variableName, response.then().extract().path(attribute).toString());
    }

    @And("the attribute {string} should be false")
    public void theAttributeShouldBeFalse(String attribute) {
        response.then().contentType("application/json").body(attribute, equalTo(false));
    }

    @And("the body should be {string}")
    public void theBodyShouldBe(String expectedValue) {
        response.then().contentType("text/plain").body(equalTo(expectedValue));
    }
}

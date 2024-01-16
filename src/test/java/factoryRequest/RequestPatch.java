package factoryRequest;

import io.restassured.response.Response;

import static io.restassured.RestAssured.given;

public class RequestPatch implements IRequest{

    @Override
    public Response send(RequestInformation requestInformation) {
        Response response =
            given()
                .headers(requestInformation.getHeaders())
                .body(requestInformation.getBody())
                .log().all()
            .when()
                .patch(requestInformation.getUrl());

        response.then().log().all();
        return response;
    }
}

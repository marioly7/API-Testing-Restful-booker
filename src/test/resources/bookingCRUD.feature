Feature: Booking Management
  Scenario: Gestión de reserva exitosa
    Given I don't require authentication
    When I send a POST request to url "/booking" with the following body
    """
    {
      "firstname" : "Marioly",
      "lastname" : "Vargas",
      "totalprice" : 517,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2024-01-04",
          "checkout" : "2024-01-06"
      },
      "additionalneeds" : "Breakfast"
    }
    """
    Then the response status should be 200
    And the attribute "booking.firstname" should be "Marioly"
    And the attribute "booking.lastname" should be "Vargas"
    And the attribute "booking.totalprice" should be 517
    And the attribute "booking.depositpaid" should be true
    And the attribute "booking.bookingdates.checkin" should be "2024-01-04"
    And the attribute "booking.bookingdates.checkout" should be "2024-01-06"
    And the attribute "booking.additionalneeds" should be "Breakfast"
    And save the "bookingid" attribute in the variable "bookingId"

    When I send a GET request to url "/booking/bookingId" with the following body
    """
    """
    Then the response status should be 200
    And the attribute "firstname" should be "Marioly"
    And the attribute "lastname" should be "Vargas"
    And the attribute "totalprice" should be 517
    And the attribute "depositpaid" should be true
    And the attribute "bookingdates.checkin" should be "2024-01-04"
    And the attribute "bookingdates.checkout" should be "2024-01-06"
    And the attribute "additionalneeds" should be "Breakfast"

    Given I require authentication
    When I send a PUT request to url "/booking/bookingId" with the following body
    """
    {
      "firstname" : "Steffany",
      "lastname" : "Vargas",
      "totalprice" : 623,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2024-01-04",
          "checkout" : "2024-01-06"
      },
      "additionalneeds" : "Dinner"
    }
    """
    Then the response status should be 200
    And the attribute "firstname" should be "Steffany"
    And the attribute "lastname" should be "Vargas"
    And the attribute "totalprice" should be 623
    And the attribute "depositpaid" should be true
    And the attribute "bookingdates.checkin" should be "2024-01-04"
    And the attribute "bookingdates.checkout" should be "2024-01-06"
    And the attribute "additionalneeds" should be "Dinner"

    When I send a PATCH request to url "/booking/bookingId" with the following body
    """
    {
      "lastname" : "Toledo",
      "depositpaid" : false
    }
    """
    Then the response status should be 200
    And the attribute "firstname" should be "Steffany"
    And the attribute "lastname" should be "Toledo"
    And the attribute "totalprice" should be 623
    And the attribute "depositpaid" should be false
    And the attribute "bookingdates.checkin" should be "2024-01-04"
    And the attribute "bookingdates.checkout" should be "2024-01-06"
    And the attribute "additionalneeds" should be "Dinner"

    When I send a DELETE request to url "/booking/bookingId" with the following body
    """
    """
    Then the response status should be 201
    And the body should be "Created"

  Scenario: Eliminación de reserva fallida por reserva inexistente
    Given I require authentication
    When I send a DELETE request to url "/booking/999999" with the following body
    """
    """
    Then the response status should be 405
    And the body should be "Method Not Allowed"

  Scenario: Edición de reserva fallida por campos vacíos
    Given I don't require authentication
    When I send a POST request to url "/booking" with the following body
    """
    {
      "firstname" : "Marioly",
      "lastname" : "Vargas",
      "totalprice" : 517,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2024-01-04",
          "checkout" : "2024-01-06"
      },
      "additionalneeds" : "Breakfast"
    }
    """
    Then the response status should be 200
    And the attribute "booking.firstname" should be "Marioly"
    And the attribute "booking.lastname" should be "Vargas"
    And the attribute "booking.totalprice" should be 517
    And the attribute "booking.depositpaid" should be true
    And the attribute "booking.bookingdates.checkin" should be "2024-01-04"
    And the attribute "booking.bookingdates.checkout" should be "2024-01-06"
    And the attribute "booking.additionalneeds" should be "Breakfast"
    And save the "bookingid" attribute in the variable "bookingId"

    When I send a GET request to url "/booking/bookingId" with the following body
    """
    """
    Then the response status should be 200
    And the attribute "firstname" should be "Marioly"
    And the attribute "lastname" should be "Vargas"
    And the attribute "totalprice" should be 517
    And the attribute "depositpaid" should be true
    And the attribute "bookingdates.checkin" should be "2024-01-04"
    And the attribute "bookingdates.checkout" should be "2024-01-06"
    And the attribute "additionalneeds" should be "Breakfast"

    Given I require authentication
    When I send a PUT request to url "/booking/bookingId" with the following body
    """
    {
          "firstname" : null,
          "lastname" : null,
          "totalprice" : null,
          "depositpaid" : null,
          "bookingdates" : {
              "checkin" : null,
              "checkout" : null
          },
          "additionalneeds" : null
    }
    """
    Then the response status should be 400
    And the body should be "Bad Request"

    When I send a PATCH request to url "/booking/bookingId" with the following body
    """
    {
          "firstname" : null,
          "lastname" : null,
          "totalprice" : null,
          "depositpaid" : null,
          "bookingdates" : {
              "checkin" : null,
              "checkout" : null
          },
          "additionalneeds" : null
    }
    """
    Then the response status should be 500
    And the body should be "Internal Server Error"

  Scenario: Edición de reserva fallida por campos inválidos
    Given I don't require authentication
    When I send a POST request to url "/booking" with the following body
    """
    {
      "firstname" : "Marioly",
      "lastname" : "Vargas",
      "totalprice" : 517,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2024-01-04",
          "checkout" : "2024-01-06"
      },
      "additionalneeds" : "Breakfast"
    }
    """
    Then the response status should be 200
    And the attribute "booking.firstname" should be "Marioly"
    And the attribute "booking.lastname" should be "Vargas"
    And the attribute "booking.totalprice" should be 517
    And the attribute "booking.depositpaid" should be true
    And the attribute "booking.bookingdates.checkin" should be "2024-01-04"
    And the attribute "booking.bookingdates.checkout" should be "2024-01-06"
    And the attribute "booking.additionalneeds" should be "Breakfast"
    And save the "bookingid" attribute in the variable "bookingId"

    When I send a GET request to url "/booking/bookingId" with the following body
    """
    """
    Then the response status should be 200
    And the attribute "firstname" should be "Marioly"
    And the attribute "lastname" should be "Vargas"
    And the attribute "totalprice" should be 517
    And the attribute "depositpaid" should be true
    And the attribute "bookingdates.checkin" should be "2024-01-04"
    And the attribute "bookingdates.checkout" should be "2024-01-06"
    And the attribute "additionalneeds" should be "Breakfast"

    Given I require authentication
    When I send a PUT request to url "/booking/bookingId" with the following body
    """
    {
          "firstname" : 123,
          "lastname" : 456,
          "totalprice" : "abc",
          "depositpaid" : 6,
          "bookingdates" : {
              "checkin" : "202dd4-01-04",
              "checkout" : "202dd4-01-06"
          },
          "additionalneeds" : "Dinner"
    }
    """
    Then the response status should be 500
    And the body should be "Internal Server Error"

    When I send a PATCH request to url "/booking/bookingId" with the following body
    """
    {
          "firstname" : 123,
          "lastname" : 456,
          "totalprice" : "abc",
          "depositpaid" : 6,
          "bookingdates" : {
              "checkin" : "202dd4-01-04",
              "checkout" : "202dd4-01-06"
          },
          "additionalneeds" : "Dinner"
    }
    """
    Then the response status should be 400
    And the body should be "Bad Request"

  Scenario: Creación de reserva fallida por campos inválidos
    Given I don't require authentication
    When I send a POST request to url "/booking" with the following body
    """
    {
      "firstname" : 123,
      "lastname" : 456,
      "totalprice" : "abc",
      "depositpaid" : 6,
      "bookingdates" : {
          "checkin" : "202dd4-01-04",
          "checkout" : "202dd4-01-06"
      },
      "additionalneeds" : "Breakfast"
    }
    """
    Then the response status should be 500
    And the body should be "Internal Server Error"

  Scenario: Creación de reserva fallida por campos vacíos
    Given I don't require authentication
    When I send a POST request to url "/booking" with the following body
    """
    {
          "firstname" : null,
          "lastname" : null,
          "totalprice" : null,
          "depositpaid" : null,
          "bookingdates" : {
              "checkin" : null,
              "checkout" : null
          },
          "additionalneeds" : null
    }
    """
    Then the response status should be 500
    And the body should be "Internal Server Error"


  Scenario: Obtención de reserva por id fallida por reserva inexistente
    Given I don't require authentication
    When I send a GET request to url "/booking/0" with the following body
    """
    """
    Then the response status should be 404
    And the body should be "Not Found"


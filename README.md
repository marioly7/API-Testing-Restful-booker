# API TESTING RESTFUL-BOOKER
## [Restful-booker](https://restful-booker.herokuapp.com/) Booking Management Tests 

This project executes tests for different scenarios within the main flux (Booking Management) of the Restful-booker service.

## Scenarios

- Booking Management Successful
- Delete Booking Failed Due to Nonexistent Booking
- Edit Booking Failed Due to Invalid Fields
- Edit Booking Failed Due to Empty Fields
- Create Booking Failed Due to Invalid Fields
- Create Booking Failed Due to Empty Fields
- Get Booking ID Failed Due to Nonexistent Booking

## Tech Stack

This project utilizes the following technologies:

- [JavaScript](https://developer.mozilla.org/en/docs/Web/JavaScript) - The language used by Postman for creating test scripts.
- [Postman](https://www.postman.com/) - A platform for writing and executing test scripts for API testing.
- [Java](https://www.java.com/en/) - Includes the steps for executing the features.
- [Cucumber](https://cucumber.io/) - Contains the features with the defined scenarios.
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) - The preferred integrated development environment (IDE).

## How to Execute the Tests

The Java + Cucumber code requires SDK version 17 to run.

![image](https://github.com/marioly7/API-Testing-Restful-booker/assets/48572648/25e2b36d-e6d3-4af7-82fa-38c162ac1421)

All the necessary dependencies are already listed in the `build.gradle` file.

### Java and Cucumber Project ☕🥒

To run the project, execute the feature "Booking Management" in the `bookingCRUD.feature` file.

> Note: `src > test > resources > bookingCRUD.feature`

### Postman Project 📨

Executing the tests on Postman requires the installation of Postman Desktop and importing the `Restful-booker.postman_collection.json` file.

> Note: `postman_collection > Restful-booker.postman_collection.json`

After importing, run the collection by right-clicking on the `Restful-booker` collection and selecting "Run Collection".

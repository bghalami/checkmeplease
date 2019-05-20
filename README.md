# Card
As a user I would like to be able use my medical recommendation and id for multiple orders. I would also like to be able to replace or delete my id and medical recommendation.

# Discussion
Create a service for a dispensary, that stores users, medical recommendations and IDs.

The Users service should allow a user to upload a State ID and medical recommendation metadata. The user should be able to update or delete the ID or Recommendation.

Store users' name, email address and date of birth.

Store the medical recommendation number, issuer, state, expiration date and path to the image.

Store the State ID number, state, expiration date and path to the image.

If the id or recommendation is expired, make sure the data returned indicates that clearly.

# Notes 
Use your normal development practices and git workflow, as if this were a production app.
Please push any intermediate commits when you complete them.

In the initial commit message, include an estimate of how long you think it will take to complete the exercise (not including the bonus tasks).
For example: `Initial commit - estimating x hours`

In the final commit message, include how long it took to complete the exercise.
For example: `Make sure foo works properly - completed in y hours`

# Confirmation
* API endpoint that returns a User, medical recommendation, and id.
* If the id or recommendation are expired, be sure that is clearly indicated.
* Ability to delete or update the medical recommendation and id.
* Create a dev branch and create a pull request to master.

![Sample Rec](image2.gif)

# Bonus
* Image uploads
* Deploy the application
* Create a frontend

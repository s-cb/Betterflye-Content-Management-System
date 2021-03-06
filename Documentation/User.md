# Regular User Features
- User can post comments without any profanity in them.
  - User notified by a pop-up if their comment contains profanity.
  - Click on the comment button on a user post to create a comment.

- User can create an account without profanity in first name, last name, or username.
  - If profanity is entered in first name, last name, or username, it will not be registered.
  - Click 'sign-up' on the main page to reach the user registration. 

- User can create a status for their profile without any profanity in it.
  - On the homepage or profile page, write a status in the status box.

![Profile Status](https://user-images.githubusercontent.com/42616554/102121183-2d442300-3e09-11eb-890f-9d44303e75be.png)

- User can write a review for an organization without any profanity.
  - On an organization page, click the 'review' button and write a review.
  - If the review contains profanity, it will not be posted. 

- Users can create an organization without profanity in the name, misson statement, or description.
  - Click on the dashboard and then click on the organization button.
  - On the organization page click Create Organization.
  - Follow each step to create an organization starting with the name.
  - If profanity is detected in the oraganization name then the user cannot create an organization.
  - If profanity is detected in the mission statement then the user cannot create an organization.
  - If profanity is detected in the description then the user cannot create an organization.
  
![OrgName](https://user-images.githubusercontent.com/42616554/102119004-17812e80-3e06-11eb-8193-2e2d1e24cc4a.png)
![Org Mission Statement](https://user-images.githubusercontent.com/42616554/102119173-4f887180-3e06-11eb-95f0-525554ca8633.png)
![Org Description](https://user-images.githubusercontent.com/42616554/102119191-58794300-3e06-11eb-83a1-feba8423a71b.png)
  
- Users can create an initiative for an organization that they created without profanity in the name, description, additional information, or tags.
  - On the organizations page click the Create Initiative button.
  - Follow each step starting with the name.
  - If profanity is detected in the name then the user cannot create an initiative.
  - If profanity is detected in the description then the user cannot create an initiative.
  - If profanity is detected in the additional information then the user cannot create an initiative.
  - If profanity is detected in the tags then the user cannot create an initiative.

![Initiative Name](https://user-images.githubusercontent.com/42616554/102119471-c6be0580-3e06-11eb-9f5b-78646ff289ff.png)
![Initiative Description](https://user-images.githubusercontent.com/42616554/102119519-d89fa880-3e06-11eb-8b33-dc39d07106c2.png)
![Initiative Details](https://user-images.githubusercontent.com/42616554/102119533-dfc6b680-3e06-11eb-8629-1615ef3a6ff5.png)
![Initiative Tags](https://user-images.githubusercontent.com/42616554/102119556-e81ef180-3e06-11eb-87c2-3285cbfd4274.png)

- Users can appeal posts that were blocked by the content filter.
  - Click the three dots next to the post and select Appeal. Enter the reason, and select 'ok'.
![appeal](https://user-images.githubusercontent.com/54246161/107291753-a68d7a00-6a36-11eb-9ce3-34214bce5676.png)
<a href="https://github.com/tms326/Betterflye/blob/content-filter-testing/Documentation/User.md">Link to main Betterflye user guide</a>

# Admin Features

- Admin can add words to the blacklist or the whitelist.
  - On the dashboard, type a word into the corresponding text box and click 'add'.
  ![adminadd](https://user-images.githubusercontent.com/54246161/107291438-2d8e2280-6a36-11eb-9b29-5ada6b9dd216.png)
  
  ![adminwhitelist](https://user-images.githubusercontent.com/54246161/107291479-3e3e9880-6a36-11eb-90bd-50f5a90b716a.png)

- Admin can resolve flags created by users.
  - Next to each flag, use the drop-down box to choose an action to resolve the flag.
  ![flagged](https://user-images.githubusercontent.com/54246161/107291758-a68d7a00-6a36-11eb-9c6a-4db9a48d16ef.png)
  - Resolved flags appear in their own queue.
  ![resolvedflag](https://user-images.githubusercontent.com/54246161/107291764-a9886a80-6a36-11eb-9b07-ddda28cb0630.png)

- Admin can control user posts that were blocked by the content filter.
  - Next to each blocked post, use the drop-down box to choose an action.
  ![blocked](https://user-images.githubusercontent.com/54246161/107291756-a68d7a00-6a36-11eb-82b7-b623014cec78.png)
  - Resolved blocks appear in their own queue.
  ![resolvedblock](https://user-images.githubusercontent.com/54246161/107291763-a8efd400-6a36-11eb-9c2c-aad648e1859d.png)

# Organization Admin Features

- Organization admins can delete posts made on the organization page.
  - Click the three dots on the top right side of the post.
  - In the drop down there will be an option in red that says Delete Post.
  ![DeleteOrgPost](https://user-images.githubusercontent.com/42616554/110187218-8fe40400-7de5-11eb-8759-45d2e91a9fe7.png)
  - Click the delete post and you will be asked to confirm that you want to delete it.
  ![DeleteOrgPostConfirm](https://user-images.githubusercontent.com/42616554/110187364-139df080-7de6-11eb-98f8-a4fb5868348a.png)
  
- Organization admins can ban users from their organization.
  - Click the manage tab.
  ![ManageButton](https://user-images.githubusercontent.com/42616554/110187515-9fb01800-7de6-11eb-8a29-a16ed20d5780.png)
  - Under Users click the ban user button.
  - The Organization admin will be asked to type the username of the user they want to ban.
  ![BanFromOrg](https://user-images.githubusercontent.com/42616554/110187592-db4ae200-7de6-11eb-9bd5-8c6b366f678e.png)
  - When the user trys to go back to the Organization page they cannot and are told they are banned.
  ![BannedFromOrg](https://user-images.githubusercontent.com/42616554/110187640-06353600-7de7-11eb-9782-6a9e2d9bebcd.png)
  

## Actors
- Users
  - These are the people that use the platform. They are able to post photos and text. They are also able to flag other users' posts if they think it is
  inappropriate. Users can also appeal their flagged post to an admin so that it can be unblocked.
- Admins
  - These are the people that monitor the platform. They can do everything that a normal user can do and they can also accept or reject user appeals. Admins are also notified of any appeals and also notified of blocked posts that are caught by the filter.
- Filter System
  - This is the content management service that monitors the user's input for any inappropriate words or photos before it is posted. Admins will be notified of any blocked posts and will have the option to revert the block.

## Use Cases 
- UC1: Block inappropriate content
  - Actor: Filter system
  - meets BR1
  - This is an essential function of the content service. It ensures that the client's requirement to keep the service clean is met. Content should be blocked before it is posted to provide a good user experience.
   - Main flow:
        1. The actor accepts user input.    
        2. The actor analyzes the input.
        3. The content is posted. [A1: The content is blocked.]
   - Alternate Flows:
        - A1: The content is blocked.
          1. The admin of the page is notified.
          2. The user can request review of the content.
          3. The content is not posted.


- UC2: Appeal blocked content
  - actor: user
  - meets BR3
  - This function allows the admin to check the blocked content to make sure that it was not wrongly flagged. This allows users to have more control over the content. It allows the platform to  overcome errors made the the content filtering system.
  - Main Flow:
    1. The actor chooses to appeal their blocked submission.
    2. The admin is notified of the appeal.
    3. The admin views the content.
    4. The admin accepts the content. [A1: The admin rejects the content.]
    5. The user is notified and the submission is posted.
  - Alternate Flows:
    - A1: The admin rejects the content.
      1. The content is deleted.
      2. The user is notified.


- UC3: Control blocked content
  - Actor: Admin
  - meets BR3 and BR4
  - This allows admins to control what is on their own pages. This can also be used to identify recurring problematic users and can also be used to identify trends among the users and the content being posted on the platform. It is also necessary for admin to see blocked content in order to respond to a user appeal.
  - Main Flow:
       1. The actor views flagged or appealed posts.
       2. The actor accepts the post. [A1: The actor rejects the post.]
       3. The accepted material is posted publicly.
  - Alternate Flows:
    - A1: The actor rejects the post.
      1. The content is deleted.
      2. The user is notified.


- UC4: Flag a post
   - Actor: user
   - meets BR2
   - This is a way to remove content that bypassed the filter. Users can flag content they think is inappropriate, which shall then be reviewed by the admin of the page. The content that is not caught by the filter can be used to update the filter so that it will catch that content in the future.
   - Main Flow:
     1. The actor flags another user's post.
     2. The content is removed temporarily from public view.
     3. The admin is notified.
     4. The content is sent to the admin for review.

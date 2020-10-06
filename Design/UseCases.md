## Actors
- Users
- Admins
- Filter System

## Use Cases 
- UC1: Content System blocks inappropriate content before it is posted in order to keep the content feed clean
This is an essential function of the content service. It ensures that the client's requirement to keep the service clean is met.

Accept user input->Analyze input->if input is clean->No block
                                ->if input is not clean->block ->Admin is notified
                                                                ->User can request review
- - BR1

- UC2: Actor user appeals blocked content
This function allows the admin to check the blocked content to make sure that it was not wrongly flagged. Allows users to have more control over the content.

Content is blocked->User chooses to appeal->Admin is notified of the appeal->Admin decides whether to reverse the block or not.

- - BR3

- UC3: Admins can see blocked content and the users that posted the blocked content
This allows admins to control what is on their own pages. This can also be used to identify recurring problematic users and can also be used to 
identify trends among the users and the content being posted on the platform.

View flagged post->Accept->Post accepted material
                ->Reject->Removes material->Original uploader notified of their removed post

- - BR3 & BR4

- UC4: User flags a post
This is a way to remove content that bypassed the filter. Users can flag content they think is inappropriate. The content that is not caught by the filter can be used to
update the filter so that it will catch that content in the future.

Flag content->Remove content temporarily->Notify Admin->Admin can choose to block or not

- - BR2

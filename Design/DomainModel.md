# Domain Model
![domainmodel (1)](https://user-images.githubusercontent.com/54246161/96283056-735b4280-0f90-11eb-984d-ff64db79c06b.png)

## Classes
- User: This is the parent class that supports all users of the Betterflye service. As a user, they can browse the website and upload content.
   - RegularUser: A child class of User. This is an average user with no special permissions.
   - Admin: A child class of User. Admins are users who run their own pages and have special permissions, such as the option to delete other users' posts. They also can approve appeals or flags.  
- Appeal: This is created when a RegularUser has submitted content that the Content Filter blocked and requested a manual review by an Admin. The Appeal contains information about the blocked post and the user who submitted it and allows the admin to reject the appeal, permanently deleting the content, or to approve the appeal, allowing the content to be posted publicly.
- Post: This class contains the content that a user has created and wishes to be posted publicly. A Post interacts with the Content System, which decides whether to block or allow the post. If it is allowed, the content of the post is made public.
- Filter System: This class is the main goal of the project. The Filter System will be able to analyze Post content to determine if it contains inappropriate content. If it does, then the system will block the post from becoming public.
- Message: A Message is created when a Filter System blocks a post. This message contains information about the post and the user who created it, and it is sent to an admin.

# Business Requirements

## BR1
We want to prevent users from posting inappropriate content.
- The client wants the website to be appropriate for users of all ages. Acceptance testing revealed that people were worried about 
the lack of a content filter. Inappropriate content on the feed would deter future users and lower the reputation of the client. 

## BR2
We want users to have the option to flag content.
- No algorithm is perfect, we want users to have the option to manually flag content they find inappropriate. Flagging can be used as input to "train" 
the service. Flagging serves as a backup filter for content that aren't caught or is unable to be caught by the algorithm.  

## BR3 
We want admins to be able to control user content.
- We want admins to control content so what is posted on the platform can be reflected in a positive light. This can be an additional backup if the service itself
fails. Admins should have the ability to reply to appeals for blocked content to be unblocked. 

## BR4 
We want admins to be alerted to content blocks.
- This will keep admins and other staff in touch with the current state of the platform with alerts. It will allow admins to see what type of content is being posted or 
blocked more frequently. In addition, admins can see which users are causing most blocks, and take further action if needed. 

## BR5 
We want the content service to be able to scale with more users or different platforms.
- Because the client is a startup, there are few users, but has potential to grow significantly, and the service needs to be able to accomodate this. The platform needs to be kept clean
whether the user size is small or large. Content service should be able to transfer to any device or technology platform the client chooses in the future. 

# Functional Requirements
- FR1: If inappropriate content is drafted, the content filter prevents it from being posted.
  - Priority: High
  - BR1

- FR2: If a user's post is blocked, they can make an appeal to an admin.
  - Priority: Medium
  - BR3

- FR3: If inappropriate content bypasses this filter, then users can manually flag the content.
  - Priority: Medium
  - BR2

- FR4: Admins shall receive alerts when content is blocked.
  - Priority: Low 
  - BR4

- FR5: If content is flagged by users, the content is temporarily removed from the platform until admin review.
  - Priority: Medium
  - BR2

- FR6: The system shall accept user input as text or photo file.
  - Priority: High
  - BR1

- FR7: The system shall evaluate the submitted content before it is posted.
  - Priority: High
  -BR1

- FR8: The admin shall be able to approve or reject content.
  - Priority: Medium
  - BR3

- FR9: The user shall receive an alert if their upload is blocked by the filter.
  - Priority: Low
  - BR1

# Nonfunctional Requirements
- NR1: The system shall be able to scale with new users.
  - Priority: High
  - BR5

- NR2: The content filter shall not cause lag for users.
  - Priority: High
  - BR1

- NR3: Records of users who have uploaded blocked content shall be stored. 
  - Priority: Low
  - BR3, BR4

- NR4: The software shall be written using PHP.
  - Priority: High
  - BR5

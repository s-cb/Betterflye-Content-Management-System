# Development Environment Manual

## BACKEND & FRONTEND (for dashboard & API)

### Install Prerequisites

*   Install XAMPP (v7.3.11 is tested)
    *   <a href="https://www.apachefriends.org/download.html" target="_blank">https://www.apachefriends.org/download.html</a>
    *   Run the apache and mysql by running **xampp-control.exe** (or corresponding executable if you are in MAC).
*   Install Cypress
    * <a href="https://www.cypress.io/">https://www.cypress.io/</a>
    * This is for running the automated UI tests.
*   Install CORS chrome extension  
<a href="https://chrome.google.com/webstore/detail/allow-cors-access-control/lhobafahddgcelffkeicbaginigeejlf?hl=en">https://chrome.google.com/webstore/detail/allow-cors-access-control/lhobafahddgcelffkeicbaginigeejlf?hl=en</a>
    * This is for image filtering. When developing locally, accessing images from the betterflye s3 photo bucket may be blocked, resulting in the following error:
    ![corsblock](https://user-images.githubusercontent.com/40703034/114089248-e7add900-9883-11eb-91b8-34e953bd78c0.png)
    * A chrome extension can bypass this error

### Create DB Tables

*   Browse to <a href="http://localhost/phpMyAdmin/" target="_blank">http://localhost/phpMyAdmin/</a>
    *   Default username should be **root** without a password if asked.
*   Create a database by using the new button on top-left.
    *   Database name: **betterflye**
    *   Leave everything else same and click **create**.
*   Click on the new **betterflye** and select **SQL** tab.
*   Copy the contents of this sql file.
    *   <a href="https://github.com/s-cb/Betterflye-Content-Management-System/blob/master/Documentation/betterflye_tim_new.sql" target="_blank">https://github.com/s-cb/Betterflye-Content-Management-System/blob/master/Documentation/betterflye_tim_new.sql</a>
*   Paste it into the textbox in **SQL** tab and click **GO** button on bottom-right.
*   Copy the contents of this sql file as well.
    *    <a href="https://github.com/s-cb/Betterflye-Content-Management-System/blob/master/Documentation/cms.sql" target="_blank">https://github.com/s-cb/Betterflye-Content-Management-System/blob/master/Documentation/cms.sql</a>    
*   Paste it into the textbox in **SQL** tab and click **GO** button on bottom-right.
### Clone Repositories

*   Browse to **C:/xampp/htdocs** folder. (find the relevant folder under xampp installation in MAC)
*   Clone the repository in that folder.
    *  <a href="https://github.com/tms326/Betterflye.git" target="_blank">https://github.com/tms326/Betterflye.git</a>
*   You can do it via command line (or choose your own way of cloning a repository, NOT DOWNLOADING).  

    *   **Shift+Right-click** to an empty place on that folder to open a command line.
    *   Run these commands (it assumes you have **git** installed and **git** command accessible in PATH environment variable):
        *   <pre>git clone https://github.com/tms326/Betterflye.git</pre>
*   Browse to **C:/xampp/htdocs/Betterflye/php** folder. Create a folder called contentManagementSystem.
*   Clone the content management library into that folder 
    * <a href="https://github.com/jdibble21/Content-Management-System.git" target="_blank">https://github.com/jdibble21/Content-Management-System.git</a> 
* Open the file /xampp/apache/conf/httpd.conf and change the DocumentRoot and Directory to match the Betterflye folder.
* After cloning the project in PHPStorm, checkout the branch **content-filter-library**
### Change DataLayer.php
*  In the project, go to DataLayer.php in the folder php/classes.
*  Copy the following: 
        $hostname = '10.0.0.46';<br>
        $port = 3306;<br>
        $dbName = 'betterflye';<br>
        $dbUsername = 'root';<br>
        $dbPass = '';<br>
* $hostname will need to be changed to the server name seen in phpmyadmin.
* In the construct__ function, paste and replace the following:
   $hostname = $_SERVER['RDS_HOSTNAME'];<br>
   $port = $_SERVER['RDS_PORT'];<br>
   $dbName = $_SERVER['RDS_DB_NAME'];<br>
   $dbUsername = $_SERVER['RDS_USERNAME'];<br>
   $dbPass = $_SERVER['RDS_PASSWORD'];<br>


### Test the Development Environment

*   Simply browse to <a href="http://localhost/Betterflye" target="_blank">http://localhost/Betterflye</a>
*   Create user.
*   To test the filter:
    *  Create a status update on the profile page and see if it is blocked based on content. 
    *  Try to create an organization or initiative with profanity in the title, description, tags, or other user input areas.
* To test admin flag messages:
    *  Login to the betterflyeAdmin account:
       <p>user: betterflyeAdmin</p>
       <p>password: password</p>
    * On the dashboard, you can view the block messages from other users you have created. 

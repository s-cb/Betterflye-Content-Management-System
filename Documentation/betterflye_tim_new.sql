drop database if exists betterflye;
create database betterflye;
USE betterflye;

DROP TABLE IF EXISTS `contributions`;
CREATE TABLE `contributions` (
                                 `contribID` int(11) NOT NULL AUTO_INCREMENT,
                                 `orgID` int(11) DEFAULT NULL,
                                 `userID` int(11) NOT NULL,
                                 `initID` int(11) NOT NULL,
                                 `contribDate` datetime DEFAULT current_timestamp(),
                                 `description` text DEFAULT NULL,
                                 `appreciation` text DEFAULT NULL,
                                 `contributionType` varchar(255) DEFAULT NULL,
                                 `amount` decimal(10,2) NOT NULL,
                                 `validated` int(11) NOT NULL DEFAULT 0,
                                 `validationRequested` int(11) NOT NULL DEFAULT 0,
                                 PRIMARY KEY (`contribID`)
);


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `username` varchar(255) NOT NULL,
                         `passwordHash` varchar(255) NOT NULL,
                         `email` varchar(255) NOT NULL,
                         `firstname` varchar(255) NOT NULL,
                         `lastname` varchar(255) NOT NULL,
                         `userID` int(11) NOT NULL AUTO_INCREMENT,
                         `volHours` double(15,1) DEFAULT 0.0,
                         `donMoney` double(15,2) DEFAULT 0.00,
                         `donItem` double(15,1) DEFAULT 0.0,
                         `impactNum` int(11) DEFAULT 0,
                         `influence` int(11) DEFAULT 0,
                         `activeUser` int(11) NOT NULL DEFAULT 1,
                         `dateJoined` datetime DEFAULT current_timestamp(),
                         `superuser` int(11) NOT NULL DEFAULT 0,
                         PRIMARY KEY (`userID`),
                         UNIQUE KEY `username` (`username`),
                         UNIQUE KEY `email` (`email`),
                         KEY `login` (`username`,`passwordHash`)
);
DROP TABLE IF EXISTS `initiatives`;
CREATE TABLE `initiatives` (
                               `initName` varchar(255) NOT NULL,
                               `initDesc` text DEFAULT NULL,
                               `donationType` varchar(255) NOT NULL DEFAULT 'Money Donation',
                               `hardLimit` int(11) DEFAULT NULL,
                               `amountDonated` int(11) DEFAULT 0,
                               `creatorID` int(11) DEFAULT NULL,
                               `initID` int(11) NOT NULL AUTO_INCREMENT,

                               `about` varchar(255) DEFAULT NULL,
                               `location` varchar(255) DEFAULT 'ONLINE',
                               `creationDate` datetime DEFAULT current_timestamp(),
                               `startDate` varchar(255) DEFAULT NULL,
                               `startTime` varchar(255) DEFAULT NULL,
                               `endDate` varchar(255) DEFAULT NULL,
                               `endTime` varchar(255) DEFAULT NULL,
                               `activeInit` int(11) NOT NULL DEFAULT 1,
                               PRIMARY KEY (`initID`),
                               KEY `creatorID` (`creatorID`),
                               CONSTRAINT `initiatives_ibfk_1` FOREIGN KEY (`creatorID`) REFERENCES `users` (`userID`)
);


DROP TABLE IF EXISTS `organizations`;
CREATE TABLE `organizations` (
                                 `orgID` int(11) NOT NULL AUTO_INCREMENT,
                                 `orgName` varchar(255) NOT NULL,
                                 `orgEmail` varchar(255) DEFAULT NULL,
                                 `type` varchar(255) DEFAULT NULL,
                                 `volHours` int(11) DEFAULT 0,
                                 `logo` varchar(255) DEFAULT NULL,
                                 `donItem` int(11) DEFAULT 0,
                                 `donMoney` float DEFAULT 0,
                                 `impactNum` int(11) DEFAULT 0,
                                 `paidStatus` int(11) DEFAULT 0,
                                 `apiPaid` int(11) DEFAULT 0,
                                 `apiKey` varchar(64) DEFAULT NULL,
                                 `missionStatement` text DEFAULT NULL,
                                 `aboutUs` text DEFAULT NULL,
                                 `location` varchar(255) DEFAULT NULL,
                                 `website` varchar(255) DEFAULT NULL,
                                 PRIMARY KEY (`orgID`),
                                 UNIQUE KEY `orgName` (`orgName`),
                                 UNIQUE KEY `orgEmail` (`orgEmail`)
);

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
                        `tagName` varchar(255) NOT NULL,
                        `tagID` int(11) NOT NULL AUTO_INCREMENT,
                        PRIMARY KEY (`tagID`),
                        UNIQUE KEY `tagName` (`tagName`)
);

DROP TABLE IF EXISTS `badgeImage`;
CREATE TABLE `badgeImage` (
                              `badgeID` int(11) NOT NULL,
                              `imagePath` varchar(255) DEFAULT NULL
);

DROP TABLE IF EXISTS `badgeStore`;
CREATE TABLE `badgeStore` (
    `badgeID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `badges`;
CREATE TABLE `badges` (
                          `badgeID` int(11) NOT NULL AUTO_INCREMENT,
                          `badgeName` varchar(255) DEFAULT NULL,
                          `badgeDesc` varchar(255) DEFAULT NULL,
                          `price` float NOT NULL,
                          `creatorType` varchar(255) DEFAULT NULL,
                          `creatorID` int(11) NOT NULL,
                          `oneToOne` int(11) NOT NULL DEFAULT 0,
                          `active` int(11) NOT NULL DEFAULT 1,
                          PRIMARY KEY (`badgeID`),
                          UNIQUE KEY `badgeName` (`badgeName`)
);

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
                            `commentID` int(11) NOT NULL AUTO_INCREMENT,
                            `commentText` text NOT NULL,
                            `commentDate` datetime NOT NULL DEFAULT current_timestamp(),
                            `edited` datetime NOT NULL,
                            PRIMARY KEY (`commentID`)
);

DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
                             `communityID` int(11) NOT NULL AUTO_INCREMENT,
                             `orgID` int not null,
                             PRIMARY KEY (`communityID`)
);

DROP TABLE IF EXISTS `communityInitAccess`;
CREATE TABLE `communityInitAccess` (
                                       `communityID` int(11) NOT NULL,
                                       `initID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `communitySupporter`;
CREATE TABLE `communitySupporter` (
                                      `communityID` int(11) NOT NULL,
                                      `userID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `communityOrg`;
CREATE TABLE `communityOrg` (
                                `communityID` int(11) NOT NULL,
                                `orgID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `contribImages`;
CREATE TABLE `contribImages` (
                                 `contribID` int(11) NOT NULL,
                                 `imagePath` varchar(255) DEFAULT NULL,
                                 KEY `contribImages_ibfk_1` (`contribID`),
                                 CONSTRAINT `contribImages_ibfk_1` FOREIGN KEY (`contribID`) REFERENCES `contributions` (`contribID`)
);


DROP TABLE IF EXISTS `customBadgeAccess`;
CREATE TABLE `customBadgeAccess` (
                                     `badgeID` int(11) NOT NULL,
                                     `userID` int(11) NOT NULL
);

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
CREATE TABLE `following` (
                             `followingID` int(11) NOT NULL AUTO_INCREMENT,
                             `userID` int(11) NOT NULL,
                             `followType` varchar(255) NOT NULL,
                             `followTarget` int(11) NOT NULL,
                             PRIMARY KEY (`followingID`)
);

--
-- Table structure for table `friendRequest`
--

DROP TABLE IF EXISTS `friendRequest`;
CREATE TABLE `friendRequest` (
                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                 `requesterID` int(11) NOT NULL,
                                 `requesteeID` int(11) NOT NULL,
                                 PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `friend1` int(11) NOT NULL,
                           `friend2` int(11) NOT NULL,
                           PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `hourGoals`;
CREATE TABLE `hourGoals` (
                             `initID` int(11) NOT NULL,
                             `personAmount` int(11) NOT NULL,
                             `hourAmount` int(11) NOT NULL
);

DROP TABLE IF EXISTS `initImpactReview`;
CREATE TABLE `initImpactReview` (
                                    `reviewID` int(11) NOT NULL AUTO_INCREMENT,
                                    `userID` int not null,
                                    `impactID` int(11) NOT NULL,
                                    `impactReview` text NOT NULL,
                                    PRIMARY KEY (`reviewID`)
);

DROP TABLE IF EXISTS `influence`;
CREATE TABLE `influence` (
                             `userID` int(11) NOT NULL,
                             `influencedEmail` varchar(255) NOT NULL,
                             `hasJoined` int(11) DEFAULT 0,
                             UNIQUE KEY `influencedEmail` (`influencedEmail`),
                             KEY `influencerID` (`userID`),
                             CONSTRAINT `influence_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

--
-- Table structure for table `initAffiliation`
--

DROP TABLE IF EXISTS `initAffiliation`;
CREATE TABLE `initAffiliation` (
                                   `initID` int(11) NOT NULL,
                                   `orgID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `initAttendance`;
CREATE TABLE `initAttendance` (
                                  `userID` int(11) NOT NULL,
                                  `initID` int(11) NOT NULL,
                                  `didAttend` int(11) DEFAULT 0,
                                  UNIQUE KEY `attendance` (`userID`,`initID`),
                                  KEY `initID` (`initID`),
                                  CONSTRAINT `initAttendance_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
                                  CONSTRAINT `initAttendance_ibfk_2` FOREIGN KEY (`initID`) REFERENCES `initiatives` (`initID`)
);

DROP TABLE IF EXISTS `initBadges`;
CREATE TABLE `initBadges` (
                              `badgeID` int(11) NOT NULL,
                              `initID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `initImpact`;
CREATE TABLE `initImpact` (
                              `impactID` int(11) NOT NULL AUTO_INCREMENT,
                              `initID` int(11) NOT NULL,
                              `impact` text NOT NULL,
                              PRIMARY KEY (`impactID`)
);

DROP TABLE IF EXISTS `initLogo`;
CREATE TABLE `initLogo` (
                            `initID` int(11) NOT NULL,
                            `imagePath` varchar(255) NOT NULL,
                            UNIQUE KEY `initID` (`initID`),
                            UNIQUE KEY `initLogo` (`initID`,`imagePath`),
                            CONSTRAINT `initLogoKey` FOREIGN KEY (`initID`) REFERENCES `initiatives` (`initID`)
);

DROP TABLE IF EXISTS `initManager`;
CREATE TABLE `initManager` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `initID` int(11) NOT NULL,
                               `userID` int(11) NOT NULL,
                               PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `initMoneyGoal`;
CREATE TABLE `initMoneyGoal` (
                                 `initID` int(11) NOT NULL,
                                 `dollarAmount` float NOT NULL,
                                 `amountDonated` float NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `initReviews`;
CREATE TABLE `initReviews` (
                               `initID` int(11) NOT NULL,
                               `reviewerID` int(11) NOT NULL,
                               `reviewText` text NOT NULL,
                               `reviewRating` int(11) NOT NULL,
                               KEY `reviewerID` (`reviewerID`),
                               KEY `initID` (`initID`),
                               CONSTRAINT `initReviews_ibfk_1` FOREIGN KEY (`reviewerID`) REFERENCES `users` (`userID`),
                               CONSTRAINT `initReviews_ibfk_2` FOREIGN KEY (`initID`) REFERENCES `initiatives` (`initID`)
);

DROP TABLE IF EXISTS `initTags`;
CREATE TABLE `initTags` (
                            `tagID` int(11) NOT NULL,
                            `initID` int(11) NOT NULL,
                            UNIQUE KEY `uniqueInitTag` (`tagID`,`initID`),
                            KEY `tagID` (`tagID`),
                            KEY `initID` (`initID`),
                            CONSTRAINT `initTags_ibfk_1` FOREIGN KEY (`tagID`) REFERENCES `tags` (`tagID`),
                            CONSTRAINT `initTags_ibfk_2` FOREIGN KEY (`initID`) REFERENCES `initiatives` (`initID`)
);

DROP TABLE IF EXISTS `initUpdate`;
CREATE TABLE `initUpdate` (
                              `postID` int(11) NOT NULL,
                              `initID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `initiativeUser`;
CREATE TABLE `initiativeUser` (
                                  `userID` int(11) NOT NULL,
                                  `initID` int(11) NOT NULL,
                                  UNIQUE KEY `uniqueness` (`userID`,`initID`),
                                  KEY `initID` (`initID`),
                                  CONSTRAINT `initiativeUser_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
                                  CONSTRAINT `initiativeUser_ibfk_2` FOREIGN KEY (`initID`) REFERENCES `initiatives` (`initID`)
);



DROP TABLE IF EXISTS `itemGoals`;
CREATE TABLE `itemGoals` (
                             `initID` int(11) NOT NULL,
                             `itemName` varchar(255) NOT NULL,
                             `itemAmount` int(11) NOT NULL,
                             `itemDonated` int(11) NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `itemInit`;
CREATE TABLE `itemInit` (
                            `initID` int(11) NOT NULL,
                            `itemName` varchar(255) NOT NULL,
                            `itemID` int(11) NOT NULL AUTO_INCREMENT,
                            `amountNeeded` int(11) NOT NULL,
                            `amountDonated` int(11) NOT NULL DEFAULT 0,
                            PRIMARY KEY (`itemID`),
                            KEY `initID` (`initID`),
                            CONSTRAINT `itemInit_ibfk_1` FOREIGN KEY (`initID`) REFERENCES `initiatives` (`initID`)
);

DROP TABLE IF EXISTS `orgAdmin`;
CREATE TABLE `orgAdmin` (
                            `orgID` int(11) NOT NULL,
                            `userID` int(11) NOT NULL,
                            UNIQUE KEY `uniqueness3` (`userID`,`orgID`),
                            KEY `orgID` (`orgID`),
                            KEY `userID` (`userID`),
                            CONSTRAINT `orgAdmin_ibfk_1` FOREIGN KEY (`orgID`) REFERENCES `organizations` (`orgID`),
                            CONSTRAINT `orgAdmin_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

DROP TABLE IF EXISTS `orgAffiliation`;
CREATE TABLE `orgAffiliation` (
                                  `orgID` int(11) NOT NULL,
                                  `userID` int(11) NOT NULL,
                                  UNIQUE KEY `uniqueness4` (`userID`,`orgID`),
                                  KEY `orgID` (`orgID`),
                                  KEY `userID` (`userID`),
                                  CONSTRAINT `orgAffiliation_ibfk_1` FOREIGN KEY (`orgID`) REFERENCES `organizations` (`orgID`),
                                  CONSTRAINT `orgAffiliation_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

DROP TABLE IF EXISTS `orgBadges`;
CREATE TABLE `orgBadges` (
                             `badgeID` int(11) NOT NULL,
                             `orgID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `orgComment`;
CREATE TABLE `orgComment` (
                              `commentID` int(11) NOT NULL,
                              `orgID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `orgLogo`;
CREATE TABLE `orgLogo` (
                           `orgID` int(11) NOT NULL,
                           `imagePath` varchar(255) NOT NULL,
                           UNIQUE KEY `orgID` (`orgID`),
                           UNIQUE KEY `orgLogo` (`orgID`,`imagePath`),
                           CONSTRAINT `orgLogoKey` FOREIGN KEY (`orgID`) REFERENCES `organizations` (`orgID`)
);

DROP TABLE IF EXISTS `orgMember`;
CREATE TABLE `orgMember` (
                             `orgID` int(11) NOT NULL,
                             `userID` int(11) NOT NULL,
                             UNIQUE KEY `uniqueness2` (`userID`,`orgID`),
                             KEY `orgID` (`orgID`),
                             KEY `userID` (`userID`),
                             CONSTRAINT `orgMember_ibfk_1` FOREIGN KEY (`orgID`) REFERENCES `organizations` (`orgID`),
                             CONSTRAINT `orgMember_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

DROP TABLE IF EXISTS `orgPost`;
CREATE TABLE `orgPost` (
                           `postID` int(11) NOT NULL,
                           `orgID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `orgReviews`;
CREATE TABLE `orgReviews` (
                              `orgID` int(11) NOT NULL,
                              `reviewerID` int(11) NOT NULL,
                              `reviewText` text NOT NULL,
                              `reviewRating` int(11) NOT NULL,
                              KEY `reviewerID` (`reviewerID`),
                              KEY `orgID` (`orgID`),
                              CONSTRAINT `orgReviews_ibfk_1` FOREIGN KEY (`reviewerID`) REFERENCES `users` (`userID`),
                              CONSTRAINT `orgReviews_ibfk_2` FOREIGN KEY (`orgID`) REFERENCES `organizations` (`orgID`)
);

DROP TABLE IF EXISTS `orgSocialLinks`;
CREATE TABLE `orgSocialLinks` (
                                  `orgID` int(11) NOT NULL,
                                  `orgTwitter` varchar(255) DEFAULT NULL,
                                  `orgFacebook` varchar(255) DEFAULT NULL,
                                  `orgLinkedin` varchar(255) DEFAULT NULL,
                                  `orgInstagram` varchar(255) DEFAULT NULL,
                                  KEY `orgSocialLinks_ibfk_1` (`orgID`),
                                  CONSTRAINT `orgSocialLinks_ibfk_1` FOREIGN KEY (`orgID`) REFERENCES `organizations` (`orgID`)
);

DROP TABLE IF EXISTS `orgTags`;
CREATE TABLE `orgTags` (
                           `tagID` int(11) NOT NULL,
                           `orgID` int(11) NOT NULL,
                           UNIQUE KEY `uniqueOrgTags` (`tagID`,`orgID`),
                           KEY `tagID` (`tagID`),
                           KEY `orgID` (`orgID`),
                           CONSTRAINT `orgTags_ibfk_1` FOREIGN KEY (`tagID`) REFERENCES `tags` (`tagID`),
                           CONSTRAINT `orgTags_ibfk_2` FOREIGN KEY (`orgID`) REFERENCES `organizations` (`orgID`)
);

DROP TABLE IF EXISTS `orgUpdate`;
CREATE TABLE `orgUpdate` (
                             `postID` int(11) NOT NULL,
                             `orgID` int(11) NOT NULL
);


DROP TABLE IF EXISTS `phinxlog`;
CREATE TABLE `phinxlog` (
                            `version` bigint(20) NOT NULL,
                            `migration_name` varchar(100) DEFAULT NULL,
                            `start_time` timestamp NULL DEFAULT NULL,
                            `end_time` timestamp NULL DEFAULT NULL,
                            `breakpoint` tinyint(1) NOT NULL DEFAULT 0,
                            PRIMARY KEY (`version`)
);

DROP TABLE IF EXISTS `postAppreciation`;
CREATE TABLE `postAppreciation` (
                                    `postID` int(11) NOT NULL,
                                    `userID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `postComment`;
CREATE TABLE `postComment` (
                               `commentID` int(11) NOT NULL,
                               `postID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `postTags`;
CREATE TABLE `postTags` (
                            `postID` int(11) NOT NULL,
                            `tagID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
                         `postID` int(11) NOT NULL AUTO_INCREMENT,
                         `postText` text NOT NULL,
                         `postImage` varchar(255) NOT NULL,
                         `postDate` datetime NOT NULL DEFAULT current_timestamp(),
                         `editedDate` datetime NOT NULL,
                         `blocked` tinyint(1) NOT NULL DEFAULT 1,
                         PRIMARY KEY (`postID`)
);

DROP TABLE IF EXISTS `privateInitAccess`;
CREATE TABLE `privateInitAccess` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `initID` int(11) NOT NULL,
                                     `userID` int(11) NOT NULL,
                                     PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `privateInits`;
CREATE TABLE `privateInits` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `initID` int(11) NOT NULL,
                                PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `shareInitCounter`;
CREATE TABLE `shareInitCounter` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `initID` int(11) NOT NULL,
                                    `count` int(11) NOT NULL DEFAULT 0,
                                    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `shareOrgCounter`;
CREATE TABLE `shareOrgCounter` (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `orgID` int(11) NOT NULL,
                                   `count` int(11) NOT NULL DEFAULT 0,
                                   PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `shareUserCounter`;
CREATE TABLE `shareUserCounter` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `userID` int(11) NOT NULL,
                                    `count` int(11) NOT NULL DEFAULT 0,
                                    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `subInit`;
CREATE TABLE `subInit` (
                           `masterInit` int(11) NOT NULL,
                           `subInit` int(11) NOT NULL
);

DROP TABLE IF EXISTS `subInitPermission`;
CREATE TABLE `subInitPermission` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `initID` int(11) NOT NULL,
                                     PRIMARY KEY (`id`)
);



DROP TABLE IF EXISTS `unfollowInitCount`;
CREATE TABLE `unfollowInitCount` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `initID` int(11) NOT NULL,
                                     `count` int(11) NOT NULL DEFAULT 0,
                                     PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `unfollowOrgCount`;
CREATE TABLE `unfollowOrgCount` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `orgID` int(11) NOT NULL,
                                    `count` int(11) NOT NULL DEFAULT 0,
                                    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `unfollowUserCount`;
CREATE TABLE `unfollowUserCount` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `userID` int(11) NOT NULL,
                                     `count` int(11) NOT NULL DEFAULT 0,
                                     PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `userBadges`;
CREATE TABLE `userBadges` (
                              `badgeID` int(11) NOT NULL,
                              `userID` int(11) NOT NULL,
                              `count` int(11) DEFAULT 1
);

DROP TABLE IF EXISTS `userBio`;
CREATE TABLE `userBio` (
                           `userID` int(11) NOT NULL,
                           `bioText` text NOT NULL
);

DROP TABLE IF EXISTS `userComment`;
CREATE TABLE `userComment` (
                               `commentID` int(11) NOT NULL,
                               `userID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `userGoals`;
CREATE TABLE `userGoals` (
                             `goalID` int(11) NOT NULL AUTO_INCREMENT,
                             `userID` int(11) NOT NULL,
                             `goalType` varchar(255) NOT NULL,
                             `goalAmount` int(11) NOT NULL,
                             `goalLengthType` varchar(255) NOT NULL,
                             `goalExpiration` varchar(255) NOT NULL,
                             PRIMARY KEY (`goalID`),
                             KEY `userID` (`userID`),
                             CONSTRAINT `userGoals_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

DROP TABLE IF EXISTS `userGroup`;
CREATE TABLE `userGroup` (
                             `groupID` int(11) NOT NULL AUTO_INCREMENT,
                             `groupName` varchar(255) NOT NULL,
                             `groupDesc` text NOT NULL,
                             `creationDate` datetime NOT NULL DEFAULT current_timestamp(),
                             `groupManager` int(11) NOT NULL,
                             PRIMARY KEY (`groupID`)
);

DROP TABLE IF EXISTS `userGroupInit`;
CREATE TABLE `userGroupInit` (
                                 `groupID` int(11) NOT NULL,
                                 `initID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `userGroupMember`;
CREATE TABLE `userGroupMember` (
                                   `groupID` int(11) NOT NULL,
                                   `userID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `userGroupOrg`;
CREATE TABLE `userGroupOrg` (
                                `groupID` int(11) NOT NULL,
                                `orgID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `userLogo`;
CREATE TABLE `userLogo` (
                            `userID` int(11) NOT NULL,
                            `imagePath` varchar(255) NOT NULL,
                            UNIQUE KEY `userID` (`userID`),
                            UNIQUE KEY `userLogo` (`userID`,`imagePath`),
                            CONSTRAINT `userLogoKey` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

DROP TABLE IF EXISTS `userPost`;
CREATE TABLE `userPost` (
                            `postID` int(11) NOT NULL,
                            `userID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `userTagAvoidance`;;
CREATE TABLE `userTagAvoidance` (
                                    `tagID` int(11) NOT NULL,
                                    `userID` int(11) NOT NULL,
                                    UNIQUE KEY `uniqueUserTagAvoidance` (`tagID`,`userID`),
                                    KEY `tagID` (`tagID`),
                                    KEY `userID` (`userID`),
                                    CONSTRAINT `UserTagAvoidance_ibfk_1` FOREIGN KEY (`tagID`) REFERENCES `tags` (`tagID`),
                                    CONSTRAINT `UserTagAvoidance_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

DROP TABLE IF EXISTS `userTagPreference`;
CREATE TABLE `userTagPreference` (
                                     `tagID` int(11) NOT NULL,
                                     `userID` int(11) NOT NULL,
                                     UNIQUE KEY `uniqueUserTagPreference` (`tagID`,`userID`),
                                     KEY `tagID` (`tagID`),
                                     KEY `userID` (`userID`),
                                     CONSTRAINT `UserTagPreference_ibfk_1` FOREIGN KEY (`tagID`) REFERENCES `tags` (`tagID`),
                                     CONSTRAINT `UserTagPreference_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

DROP TABLE IF EXISTS `userUpdate`;
CREATE TABLE `userUpdate` (
                              `postID` int(11) NOT NULL,
                              `userID` int(11) NOT NULL
);

DROP TABLE IF EXISTS `userWelcomeTask`;
CREATE TABLE `userWelcomeTask` (
                                   `userID` int(11) NOT NULL,
                                   `done` tinyint(1) NOT NULL DEFAULT 0
);


DROP TABLE IF EXISTS `viewInitCounter`;
CREATE TABLE `viewInitCounter` (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `initID` int(11) NOT NULL,
                                   `count` int(11) NOT NULL DEFAULT 0,
                                   PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `viewOrgCounter`;
CREATE TABLE `viewOrgCounter` (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `orgID` int(11) NOT NULL,
                                  `count` int(11) NOT NULL DEFAULT 0,
                                  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `viewUserCounter`;
CREATE TABLE `viewUserCounter` (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `userID` int(11) NOT NULL,
                                   `count` int(11) NOT NULL DEFAULT 0,
                                   PRIMARY KEY (`id`)
);
DROP TABLE IF EXISTS `welcomeTasks`;
CREATE TABLE `welcomeTasks` (
                                `userID` int(11) NOT NULL,
                                `initJoin` tinyint(1) NOT NULL DEFAULT 0,
                                `sendAppre` tinyint(1) NOT NULL DEFAULT 0,
                                `inviteFriend` tinyint(1) NOT NULL DEFAULT 0,
                                `viewProfile` tinyint(1) NOT NULL DEFAULT 0,
                                `updateProfile` tinyint(1) NOT NULL DEFAULT 0
);



-- new tables 7/8/2020

CREATE TABLE `orgImpact` (
                             `impactID` int not null auto_increment,
                             `orgID` int not null,
                             `impactName` varchar(255) not null,
                             PRIMARY KEY (`impactID`)
);

CREATE TABLE `orgImpactReview` (
                                   `reviewID` int(11) NOT NULL AUTO_INCREMENT,
                                   `userID` int not null,
                                   `impactID` int(11) NOT NULL,
                                   `impactReview` text NOT NULL,
                                   PRIMARY KEY (`reviewID`)
);

CREATE TABLE `orgImpactRating` (
                                   `ratingID` int(11) NOT NULL AUTO_INCREMENT,
                                   `userID` int not null,
                                   `impactID` int(11) NOT NULL,
                                   `rating` int NOT NULL,
                                   PRIMARY KEY (`ratingID`)
);

CREATE TABLE `initImpactRating` (
                                    `ratingID` int(11) NOT NULL AUTO_INCREMENT,
                                    `userID` int not null,
                                    `impactID` int(11) NOT NULL,
                                    `rating` int NOT NULL,
                                    PRIMARY KEY (`ratingID`)
);

CREATE TABLE `orgType` (
                           `orgID` int NOT NULL,
                           `orgType` varchar(255) not null
);

CREATE TABLE `userEmail` (
                             `userID` int not null,
                             `email` varchar(255) not null
);
-- New Table 7/11/2020

CREATE TABLE initBookmark(
                             `userID` int not null,
                             `initID` int not null
);
-- New Table 7/12/2020

CREATE TABLE `initPrimaryOrg` (
                                  `initID` int(11) NOT NULL,
                                  `orgID` int(11) NOT NULL
);

CREATE TABLE `orgNotifications` (
                                    `notificationID` int(11) NOT NULL AUTO_INCREMENT,
                                    `eventType` text,
                                    `creationDate` datetime DEFAULT current_timestamp(),
                                    `content` text,
                                    `triggerID` int(11) NOT NULL,
                                    `receiverID` int(11) NOT NULL,
                                    `isRead` int(11) DEFAULT 0,
                                    `archived` int(11) DEFAULT 0,
                                    PRIMARY KEY (`notificationID`)

);

-- New Tables 7/20/2020

CREATE TABLE `impactCategory` (
                                  `categoryName` varchar(255) not null,
                                  `categoryID` int not null auto_increment,
                                  `type` varchar(255) default 'betterflye',
                                  primary key (`categoryID`)
);

CREATE TABLE `impactXP` (
                            `categoryID` int not null,
                            `userID` int not null,
                            `xp` int not null default 0
);

CREATE TABLE `impactLevel` (
                               `categoryID` int not null,
                               `userID` int not null,
                               `level` int not null default 0
);

CREATE TABLE `initImpactCategory` (
                                      `categoryID` int not null,
                                      `impactID` int not null
);

CREATE TABLE `orgImpactCategory` (
                                     `categoryID` int not null,
                                     `impactID` int not null
);

-- new table 7/31/2020

CREATE TABLE `pinnedPosts` (
    `postID` int not null
);

-- new table 8/1/2020

CREATE TABLE `initMilestones` (
                                  `initID` int not null,
                                  `userID` int not null,
                                  `postContent` text,
                                  `type` varchar(255),
                                  `milestone`  int not null,
                                  `milestoneID` int not null auto_increment,
                                  primary key (`milestoneID`)
);

-- new table 7/31/2020

CREATE TABLE `milestonePosts` (
    `postID` int not null
);

-- new table 8/7/2020

CREATE TABLE `flags`(
                        `flagID` int primary key auto_increment,
                        `flagType` varchar(255) not null,
                        `userID` int not null,
                        `resolved` boolean default false,
                        `resolution` varchar(255) default null,
                        `target` int not null,
                        `flagDate` datetime default CURRENT_TIMESTAMP()
);

-- new tables 8/11/2020

CREATE TABLE `emailConfirm` (
                                `emailHash` varchar(255) not null unique,
                                `emailAddress` varchar(255) not null unique
);

CREATE TABLE `preRegisterEmailAppre`(
                                        `sentNotifID` int not null,
                                        `emailAddress` varchar(255) not null
);

CREATE TABLE `paymentVerification` (
                                       `token` varchar(255) not null unique,
                                       `badgeName` varchar(255) not null,
                                       `sendFromID` int not null,
                                       `sendToUserName` varchar(255) not null,
                                       `points` int not null
);

CREATE TABLE `stripeConnectOrgData` (
                                        `orgID` int not null,
                                        `stateToken` varchar(255) not null unique,
                                        `accountID` varchar(255) default ''
);

CREATE TABLE `apprePaymentRecord`(
                                     `userID` int not null,
                                     `orgID` int not null
);

CREATE TABLE `donationVerification` (
                                        `token` varchar(255) not null unique,
                                        `userID` int not null,
                                        `initID` int not null,
                                        `amount` decimal(10,2) not null
);

CREATE TABLE `appreStorage` (
                                `appre` text not null,
                                `stateToken` varchar(255) not null unique
);

-- shift system tables

CREATE TABLE `initShifts`(
                             `shiftID` int not null auto_increment,
                             `initID` int not null,
                             `startTime` datetime not null,
                             `endTime` datetime not null,
                             `roleID` int,
                             `limit` int default 1,
                             primary key (`shiftID`)
);
CREATE TABLE `initRoles`(
                            `roleID` int not null auto_increment,
                            `initID` int not null,
                            `name` varchar(255) not null,
                            `description` text,
                            `limit` int default 1,
                            primary key (`roleID`)
);
-- shifts are assigned here and can have the optional role assignment too
CREATE TABLE `userVolShift`(
                               `userID` int not null,
                               `shiftID` int not null,
                               `checkInTime` datetime default null,
                               `checkOutTime` datetime default null
);
-- roles are assigned here if roles are used and shifts are not
CREATE TABLE `userVolRole`(
                              `userID` int not null,
                              `roleID` int not null
);

-- new tables 8/25/2020

CREATE TABLE `validationByEmail`(
                                    `token` varchar(255) not null unique,
                                    `contribID` int not null
);

-- NEW NOTIFICATION SYSTEM

CREATE TABLE `notifications` (
                                 `notifID` int not null auto_increment primary key,
                                 `notifType` varchar(255) not null,
                                 `eventType` varchar(255) not null,
                                 `eventTrigger` int not null,
                                 `notifDate` datetime default NOW(),
                                 `content` text not null,
                                 `images` varchar(255), -- a.png;b.png
                                 `badges` varchar(255), -- 0;10;203; -- maybe 0,1;20,2
                                 `receiver` int not null,
                                 `isRead` int not null default 0,
                                 `isArchived` int not null default 0
);

CREATE TABLE `userImpactPoints`(
                                   `userID` int not null,
                                   `points` int default 0
);

CREATE TABLE `impactPointVerify`(
                                    `userID` int not null,
                                    `points` int not null,
                                    `token` varchar(255) not null
);

-- new tables 9/18/2020

CREATE TABLE `thanksCounter` (
                                 `notifID` int not null,
                                 `thanks` int default 1
);

-- new tables 10/3/2020

CREATE TABLE `boostImpact` (
                               `userID` int not null,
                               `postID` int not null
);

-- new tables 10/20/20
create table `orgImpactXP` (
                               `orgID` int not null,
                               `categoryID` int not null,
                               `xp` int not null default 0
);
create table `orgImpactLevel` (
                                  `orgID` int not null,
                                  `categoryID` int not null,
                                  `level` int not null default 0
);

-- API TABLES 10/22/20

create table `apiKey` (
                          `apiID` int not null auto_increment,
                          `secretKey` varchar(255) not null,
                          `publicKey` varchar(255) not null,
                          primary key (apiID)
);

create table `apiUser` (
                           `userID` int not null,
                           `apiID` int not null
);

create table `apiOrg` (
                          `orgID` int not null,
                          `apiID` int not null
);

create table `apiPermissions` (
                                  `apiID` int not null,
                                  `userGet` bool default false,
                                  `userInsert` bool default false,
                                  `userUpdate` bool default false,
                                  `userDelete` bool default false,
                                  `orgGet` bool default false,
                                  `orgInsert` bool default false,
                                  `orgUpdate` bool default false,
                                  `orgDelete` bool default false,
                                  `initGet` bool default false,
                                  `initInsert` bool default false,
                                  `initUpdate` bool default false,
                                  `initDelete` bool default false,
                                  `notificationGet` bool default false,
                                  `notificationInsert` bool default false,
                                  `notificationUpdate` bool default false,
                                  `notificationDelete` bool default false
);

-- new tables 11/24/2020

create table `postCategories` (
                                  `categoryID` int not null auto_increment,
                                  `categoryName` varchar(255) not null,
                                  `desc` text not null,
                                  `user` bool not null,
                                  `init` bool not null,
                                  `org` bool not null,
                                  primary key (categoryID)
);

create table `postCategory` (
                                `categoryID` int not null ,
                                `postID` int not null
);

CREATE TABLE `appreStorageForEmail` (
                                        `appre` text not null,
                                        `stateToken` varchar(255) not null unique
);

DROP TABLE IF EXISTS `userProfilePic`;
CREATE TABLE `userProfilePic` (
                                  `userID` int(11) NOT NULL,
                                  `imagePath` varchar(255) NOT NULL,
                                  UNIQUE KEY `userID` (`userID`),
                                  CONSTRAINT `userPicKey` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

DROP TABLE IF EXISTS `orgProfilePic`;
CREATE TABLE `orgProfilePic` (
                                 `orgID` int(11) NOT NULL,
                                 `imagePath` varchar(255) NOT NULL,
                                 UNIQUE KEY `orgID` (`orgID`),
                                 CONSTRAINT `orgPicKey` FOREIGN KEY (`orgID`) REFERENCES `organizations` (`orgID`)
);

DROP TABLE IF EXISTS `inKindPledges`;
CREATE TABLE `inKindPledges`(
                                pledgeID int not null auto_increment,
                                initID int not null,
                                userID int not null,
                                itemName varchar(255) not null,
                                itemAmount int not null,
                                primary key (pledgeID)
);

DROP TABLE IF EXISTS `orgEIN`;
create table `orgEIN` (
                          orgID int not null,
                          ein varchar(255)
);

DROP TABLE IF EXISTS `TRS_USER`;
CREATE TABLE `TRS_USER` (
                            userID int not null,
                            TRS_userID int not null,
                            TRS_clientID int not null,
                            authToken varchar(255) not null
);

DROP TABLE IF EXISTS `TRS_CLIENT`;
CREATE TABLE `TRS_CLIENT` (
                              orgID int not null,
                              TRS_clientID int not null,
                              API_KEY varchar(255) not null
);

DROP TABLE IF EXISTS `TRS_SITE`;
CREATE TABLE `TRS_SITE` (
                            initID int not null,
                            TRS_siteID int not null
);

DROP TABLE IF EXISTS `TRS_SHIFT`;
CREATE TABLE `TRS_SHIFT`(
                            TRS_shiftID int not null auto_increment,
                            startTime datetime not null,
                            endTime datetime not null,
                            trs_roleID int,
                            primary key (`trs_shiftID`)
);

DROP TABLE IF EXISTS `TRS_USER_SHIFT`;
CREATE TABLE `TRS_USER_SHIFT`(
                                 TRS_shiftID int not null,
                                 userID int not null
);

DROP TABLE IF EXISTS `TRS_ROLE`;
CREATE TABLE `TRS_ROLE`(
                           TRS_roleID int not null auto_increment,
                           name varchar(255) not null,
                           primary key (`TRS_roleID`)
);

DROP TABLE IF EXISTS `TRS_USER_ROLE`;
CREATE TABLE `TRS_USER_ROLE`(
                                TRS_roleID int not null,
                                userID int not null
);

DROP TABLE IF EXISTS `TRS_TIMESLOT`;
CREATE TABLE `TRS_TIMESLOT` (
                                TRS_shiftID int not null,
                                TRS_timeslotID varchar(255) not null,
                                TRS_siteID int
);

DROP TABLE IF EXISTS `TRS_ACTIVITY`;
CREATE TABLE `TRS_ACTIVITY` (
                                TRS_roleID int not null,
                                TRS_timeslotID int not null,
                                TRS_siteID int
);
DROP TABLE IF EXISTS `adminOrgVerify`;
CREATE TABLE `adminOrgVerify` (
    orgID int not null
);

DROP TABLE IF EXISTS `emailTemplates`;
CREATE TABLE `emailTemplates` (
                                  emailID int not null auto_increment primary key,
                                  emailText text not null,
                                  owner varchar(10) not null,
                                  ownerID int not null
);

-- DROP TABLE IF EXISTS `TRS_LOG`;
-- CREATE TABLE `TRS_LOG` (
--    logID int not null primary key auto_increment,
--    TRS_JSON text not null,
--    date_received datetime default now()
-- );

-- new stuff 2/12/2021
alter table organizations ADD FULLTEXT(orgName);
alter table orgEIN ADD FULLTEXT(ein);
alter table postCategories add unique(categoryName);


insert into postCategories (categoryName, `desc`, user, init, org) value ('org: Latest News','The latest news from the organization.',0,0,1);
insert into postCategories (categoryName, `desc`, user, init, org) value ('org: Q&A','Questions and answers from the organization community.',0,0,1);
insert into postCategories (categoryName, `desc`, user, init, org) value ('org: Initiatives','Information on past and ongoing initiatives within the organization.',0,0,1);
insert into postCategories (categoryName, `desc`, user, init, org) value ('org: Initiative Creation','Notifications about new initiative opportunities',0,0,1);
insert into postCategories (categoryName, `desc`, user, init, org) value ('org: Impact Updates','Updates about the organization''s impact',0,0,1);
insert into postCategories (categoryName, `desc`, user, init, org) value ('org: General Conversation','General conversations about the org',0,0,1);
insert into postCategories (categoryName, `desc`, user, init, org) value ('org: Reviews','Reviews about the org',0,0,1);


insert into postCategories (categoryName, `desc`, user, init, org) value ('init: Latest News','The latest news from the initiative.',0,1,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('init: Q&A','Questions and answers from the initiative community.',0,1,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('init: Participation','Information on participation',0,1,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('init: Impact Updates','Updates about the initiative''s impact',0,1,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('init: General Conversation','General conversations about the Init',0,1,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('init: Reviews','Reviews about the Init',0,1,0);

insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Created Init','user joined the initiative',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Joined Init','user joined the initiative',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Init Reviews','user reviewed the initiative',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Earned Badge','user earned points in a badge',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Level Up - Badge','user leveled up a badge',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Level Up - Overall','user leveled up their overall score',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Sent Appreciation','user sent appre',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Received Appreciation','user received appre',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: General Conversation','general discourse between individuals',1,0,0);
insert into postCategories (categoryName, `desc`, user, init, org) value ('user: Positive Thoughts','status updates from positive thoughts interface',1,0,0);

create table initPost(
                         initID int not null,
                         postID int not null
);

create table postTarget(
                           postID int not null,
                           targetID int not null,
                           targetType varchar(255) not null
);


-- org recognition system - started: 2/21/2021
create table orgAwards(
                          awardID int not null primary key auto_increment,
                          orgID int not null,
                          imagePath varchar(255) null,
                          title varchar(255) not null,
                          description text not null
);

create table orgCustomBadges(
    -- all users joining the org will be awarded a 0 level badge which indicates that they may earn it, secret means they can't see it, which can make it a surprise or for certain people/groups or some shit like that
                                badgeID int not null primary key auto_increment,
                                orgID int not null,
                                badgeName varchar(255) not null,
                                badgeDescription text not null,
                                progressible bool not null default true,
                                secret bool not null default false

);

create table orgBadgeProgressionLevels(
                                          badgeID int not null,
                                          levels int not null default 1,
    -- defaults to single earn, but can be modified to allow levels
                                          progressionVariable int not null default 2
    -- starts at 2 points, multiplies by progression variable each level
);

create table orgBadgeProgressionTypes(
    -- this is a complicated table with advanced polymorphic relationships which assign types of activities that can progress the badge's points and levels
    -- example: badgeID:1,activityType:initParticipation,activityTargetType:initID,activityTarget:23,progressionAmount:9
    -- php will recognize initParticipation as the condition of being added to initUser table and progress/award the badge when the user participates in init with an id of 23
                                         badgeID int not null,
                                         activityType varchar(255) not null ,
                                         activityTargetType varchar(255) not null ,
                                         activityTarget int not null,
                                         progressionAmount int not null

);

create table awarded(
                        awardID int not null,
                        userID int not null,
                        awardDate date not null default NOW(),
                        awardAppreciation text null
);

create table orgAppreciation(
                                orgID int not null,
                                userID int not null,
                                appreText text not null,
                                orgBadgeID int null,
                                orgBadgePoints int null,
                                impactCategory int null,
                                impactCategoryPoints int null
);

create table orgSpotlight(
                             orgID int not null unique,
                             userID int not null,
                             spotlightText text not null
);

CREATE TABLE `orgMilestones` (
                                 `orgID` int not null,
                                 `postContent` text,
                                 `type` varchar(255),
                                 `milestone`  int not null,
                                 `orgMilestoneID` int not null auto_increment,
                                 primary key (`orgMilestoneID`)
);

create table userAwardPreference(
                                    userID int not null,
                                    awardID int not null
);

create table userBadgePreference(
                                    userID int not null,
                                    badgeID int not null
);

create table userOrgSupport(
                               userID int not null,
                               orgID int not null
);

DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist` (
                             `wordID` int(11) NOT NULL auto_increment primary key,
                             `word` varchar(255) NOT NULL,
                             `dateAdded` datetime NOT NULL DEFAULT current_timestamp()
);
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist` (
                             `wordID` int(11) NOT NULL auto_increment primary key,
                             `word` varchar(255) NOT NULL,
                             `dateAdded` datetime NOT NULL DEFAULT current_timestamp()
);
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
                          `messageID` int(11) NOT NULL auto_increment primary key,
                          `blockReason` varchar(255) NOT NULL,
                          `target` int(11) NOT NULL,
                          `resolved` tinyint(1) NOT NULL DEFAULT 1,
                          `resolution` varchar(255) NOT NULL,
                          `blockDate` datetime NOT NULL,
                          `appeal` int(11) NOT NULL DEFAULT 1,
                          `appealMessage` text NOT NULL
);
DROP TABLE IF EXISTS `deletedposts`;
CREATE TABLE `deletedposts` (
                                `deleteID` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                `userID` varchar(255) NOT NULL,
                                `fullName` text NOT NULL,
                                `postID` int(11) NOT NULL,
                                `originalContent` text NOT NULL,
                                `originalImage` varchar(255) NOT NULL
);
DROP TABLE IF EXISTS `bannedorgusers`;
CREATE TABLE `bannedorgusers` (
                            `orgID` int(11) NOT NULL,
                            `userID` int(11) NOT NULL,
                            UNIQUE KEY `uniqueness2` (`userID`,`orgID`),
                            KEY `orgID` (`orgID`),
                            KEY `userID` (`userID`)
);
DROP TABLE IF EXISTS `userorgposts`;
CREATE TABLE `userorgposts` (
                            `postID` INT NOT NULL ,
                            `userID` INT NOT NULL ,
                            `orgID` INT NOT NULL
);
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
insert into users(username, lastname, passwordHash, email, firstname, userID, activeUser) values ('anon','','','','Anonymous',1,0);
insert into users(username, lastname, passwordHash, email, firstname, userID, activeUser, superuser) values ('betterflyeAdmin','a','$2y$10$Xi05Te40PfCl8.EkozYQoeQb8/OXnWNWSPlAm.hiVQ59CgvUz.mwO','a','a',2,0,1);

-- actual categories from phinx file
insert into impactCategory (categoryName, type) value ('Advance Research','betterflye');
insert into impactCategory (categoryName, type) value ('Raise Awareness','betterflye');
insert into impactCategory (categoryName, type) value ('Education','betterflye');
insert into impactCategory (categoryName, type) value ('Help & Support','betterflye');
insert into impactCategory (categoryName, type) value ('Save Lives','betterflye');
insert into impactCategory (categoryName, type) value ('Inspire & Motivate','betterflye');
insert into impactCategory (categoryName, type) value ('Well Being & Good Life','betterflye');
insert into impactCategory (categoryName, type) value ('Conservation','betterflye');
insert into impactCategory (categoryName, type) value ('Advocacy & Justice','betterflye');
insert into impactCategory (categoryName, type) value ('Care & Love','betterflye');
insert into impactCategory (categoryName, type) value ('Joy & Hope','betterflye');
insert into impactCategory (categoryName, type) value ('Community & Inclusion','betterflye');

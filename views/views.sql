--DROP VIEW USERS_VIEW;
--DROP VIEW FRIENDS_VIEW;
--DROP VIEW ROSES_VIEW;
--DROP VIEW FARMS_VIEW;
--DROP VIEW NEWS_VIEW;
--DROP VIEW ALBUMS_VIEW;
--DROP VIEW PHOTOS_VIEW;
--DROP VIEW COMMENTS_VIEW;
--DROP VIEW DIALOGS_VIEW;
--DROP VIEW MESSAGES_VIEW;
--------------------------------------------------------------------------------
--SELECT * FROM USER_VIEWS;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW USERS_VIEW AS
SELECT 
    ID USER_ID,
    FIRST_NAME,
    LAST_NAME,
    AGE,
    EMAIL,
    INFO,
    AVATAR
FROM USERS;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW FRIENDS_VIEW AS
SELECT
    FRIENDS.USER_1 ME_ID,
    U1.FIRST_NAME ME_FIRST_NAME,
    U1.LAST_NAME ME_LAST_NAME,
    U1.EMAIL ME_EMAIL,
    U1.AVATAR ME_AVATAR,
    FRIENDS.USER_2 FRIEND_ID,
    U2.FIRST_NAME FRIEND_FIRST_NAME,
    U2.LAST_NAME FRIEND_LAST_NAME,
    U2.EMAIL FRIEND_EMAIL,
    U2.AVATAR FRIEND_AVATAR
FROM FRIENDS
INNER JOIN USERS U1 ON FRIENDS.USER_1 = U1.ID
INNER JOIN USERS U2 ON FRIENDS.USER_2 = U2.ID;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW ROSES_VIEW AS
SELECT
  ROSES.ID ROSE_ID,
  ROSES.NAME ROSE_NAME,
  ROSES.INFO ROSE_INFO,
  ROSES.PHOTO ROSE_PHOTO
FROM ROSES;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW FARMS_VIEW AS
SELECT
  FARMS.ID FARM_ID,
  FARMS.ADDRESS FARM_ADDRESS,
  FARMS.PHONE FARM_PHONE
FROM FARMS;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW NEWS_VIEW AS
SELECT
  NEWS.ID NEWS_ID,
  NEWS.TITLE NEWS_TITLE,
  NEWS.INFO NEWS_INFO,
  NEWS.PHOTO NEWS_PHOTO,
  NEWS.CREATED NEWS_CREATED
FROM NEWS;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW ALBUMS_VIEW AS
SELECT 
    ALBUMS.ID ALBUM_ID,
    ALBUMS.TITLE ALBUM_TITLE,
    ALBUMS.USER_ID OWNER_ID,
    ALBUMS.CREATED ALBUM_CREATED,
    USERS.FIRST_NAME OWNER_FIRST_NAME,
    USERS.LAST_NAME OWNER_LAST_NAME,
    USERS.EMAIL OWNER_EMAIL,
    USERS.AVATAR OWNER_AVATAR
FROM ALBUMS
INNER JOIN USERS ON ALBUMS.USER_ID = USERS.ID;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW PHOTOS_VIEW AS
SELECT 
    PHOTOS.ID PHOTO_ID,
    PHOTOS.PHOTO PHOTO_PATH,
    PHOTOS.CREATED PHOTO_CREATED,
    PHOTOS.LONGITUDE PHOTO_COORD_LONG,
    PHOTOS.LATITUDE PHOTO_COORD_LAT,
    PHOTOS.ALBUM_ID ALBUM_ID,
    ALBUMS.TITLE ALBUM_TITLE,
    ALBUMS.USER_ID OWNER_ID
FROM PHOTOS 
INNER JOIN ALBUMS ON PHOTOS.ALBUM_ID = ALBUMS.ID;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW COMMENTS_VIEW AS
SELECT 
    COMMENTS.ID COMMENT_ID,
    COMMENTS.INFO COMMENT_INFO,
    COMMENTS.PHOTO_ID PHOTO_ID,
    COMMENTS.CREATED COMMENT_CREATED,
    COMMENTS.USER_ID OWNER_ID,
    USERS.FIRST_NAME OWNER_FIRST_NAME,
    USERS.LAST_NAME OWNER_LAST_NAME,
    USERS.EMAIL OWNER_EMAIL,
    USERS.AVATAR OWNER_AVATAR
FROM COMMENTS 
INNER JOIN USERS ON COMMENTS.USER_ID = USERS.ID;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW DIALOGS_VIEW AS
SELECT 
    USERS_TO_DIALOGS.USER_ID USER_ID,
    U.FIRST_NAME USER_FIRST_NAME,
    U.LAST_NAME USER_LAST_NAME,
    U.EMAIL USER_EMAIL,
    U.AVATAR USER_AVATAR,
    USERS_TO_DIALOGS.DIALOG_ID DIALOG_ID,
    D.TITLE DIALOG_TITLE,
    D.CREATOR_ID CREATOR_ID,
    D.CREATED DIALOG_CREATED
FROM USERS_TO_DIALOGS 
INNER JOIN USERS U ON USERS_TO_DIALOGS.USER_ID = U.ID
INNER JOIN DIALOGS D ON USERS_TO_DIALOGS.DIALOG_ID = D.ID;
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW MESSAGES_VIEW AS
SELECT 
    MESSAGES.ID MESSAGE_ID,
    MESSAGES.INFO MESSAGE_INFO,
    MESSAGES.CREATED MESSAGE_CREATED,
    MESSAGES.USER_ID USER_ID,
    U.FIRST_NAME USER_FIRST_NAME,
    U.LAST_NAME USER_LAST_NAME,
    U.EMAIL USER_EMAIL,
    U.AVATAR USER_AVATAR,
    MESSAGES.DIALOG_ID DIALOG_ID,
    D.TITLE DIALOG_TITLE,
    D.CREATED DIALOG_CREATED
FROM MESSAGES
INNER JOIN USERS U ON MESSAGES.USER_ID = U.ID
INNER JOIN DIALOGS D ON MESSAGES.DIALOG_ID = D.ID;
--------------------------------------------------------------------------------

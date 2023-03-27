# blog_backend_jukto_interview_2023

To run the project successfully at first you have to install all that are in requirements.txt file and run a mysql server.
When all setup is completed then create a database named blog_backend and run the following command for database connection.

**migrate --settings=blog_backend.development**
You can either import data(blog_backend_mysql_data) or create data from your own.
now this command for running server, **runserver --settings=blog_backend.development **

Once all are set.

## Anonymous or registered user

An Anonymous can see all posts and their detail by hitting these endpoint "/blog/posts/", "/blog/posts/post_id".

To see comments related to the post you have to pass the query params **extra_data = comments**

To search any post by author name, title, creatiion date, data on article set these as query param
**author, title, created_at, article". 



## Trending post

To see trending post use this endpoint"/blog/trending_post/"


# User registration, login and user details

## Create

To create a post or to comment anything on users post at first have to register by providing a unique username and password.
Request body = **{"username" : "your unique username", "password" : "your password"}**
To register as user use this "auth/register/" endpoint. 

## Login

Once you are registered as a user you have to login first.
Request body will be like the user registration.
To login use this endpoint "auth/login/" and in the request body pass useername and password and here you will get a token.
Save this token,for further request you have to send this token as a header.

## Read
Only user and admin can see details 
To see any user details use this endpoint "/auth/user-data/user_id"
To see any post related to user pass query param **extra_data = posts**

## Update

Now to update any user details use this endpoint "/auth/user-data/user_id"
Only admin is permitted to change a user role.

## User list and Delete

Only admin can see all user list by using this endpoint "/auth/user-data/"
only admin can delete a user, end point "/auth/user-data/user_id".

# Posts related 

To create,update, delete, a post at first set Authorization = token "the token that you get after login".

## Create

To create a post in the request body provide the title of your post and your article data. 
Request body will be like **{"title" : "your title", "article" : "your article"}**.
The endpoint is "/blog/posts/".

## Read 

To see detail about post use this endpoint "/blog/posts/post_id".


## Update

The author, moderator and admin can update the post.
Request body will be like **{"title" : "your title", "article" : "your updated article"}**.
To see detail update or delete the post use this endpoint "/blog/posts/post_id".

## Comments related 

To create, update, delete a comment at first set Authorization = token "the token that you get after login".

## Create

Then in request body provide the post id on which post you want to comment and the comment body. 
Request body will be like **{"post": "1", "body": "the comment"}**.
And the endpoint is "/blog/comments/".

## Read

To see detail about comments use this endpoint "/blog/comments/post_id".

## Update
Only the comment owner can update his comment. 
Request bodyfor update will be like **{"post": "1", "body": "the updated comment"}**.
To update comment use this endpoint "/blog/comments/comment_id".

## Delete
Comment owner and admin can delete comment using the endpoint of update.
But for the post owner who wants to update the comments on his post must have to 
set query params **post = post_id** .


# Admin Dashboard

Only admin has access the admin dashboard.
Endpoint for admin dash board "/blog/admin-dashboard/ 

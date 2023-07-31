# blog_backend

To run the project successfully at first you have to install all that are in requirements.txt file and run a mysql server.
When all setup is completed then create a database named blog_backend and run the following command for database connection.

**migrate --settings=blog_backend.development**
You can either import data(blog_backend_mysql_data) or create data from your own.
now this command for running server, **runserver --settings=blog_backend.development **

This project aims to build a blog API using DRF, which will allow users to browse, create, update and delete posts and comment on posts. The API will be built on top of a Django backend and will follow RESTful principles for easy integration with front-end frameworks.
Features:
1. User authentication and authorization using a token authentication system.
2. Three types of user roles are admin,moderator, user.
3. Post listing and search functionality are available for all users. Here Login is not required.
4. Users can manage their posts and comments.
5. Admin can manage all users' posts.
6. Moderators can only update users' posts.
7. A trending post calculated based on user views. Here Login is not required.
8. Admin dashboard for managing posts, comments, and users.
Technical Stack: DRF, Django ORM, Mysql.

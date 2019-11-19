# README

Connepi 

## Technologies
* Ruby 2.6.3
* Rails 5.1.7
* PostgreSQL 9.4+

## Setup

**1. Environment Dependencies**

- Ruby: we recommend to use some version manager like [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv) 

**2. Environment Variables**

Create a file named `database.yml` on the config of the project with the following content and replace with your the database info.

**3. Database**

You must add the database variables on .env described above.
Create a database directly on **PostgreSQL** (with psql) or use:
```
  rails db:create // create a default database following .env
```
After that run:

```
  rails db:migrate // add tables
```

**4. Bundle**

	bundle install
	
**5. Run aplication**
```
  rails s
```

**6. API documentation**

To view the API documentation, you need to go to the following URL.
```
http://localhost:3000/apipie/1.0.html
```
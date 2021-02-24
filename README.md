# Rocket Elevators Information System

---

## :busts_in_silhouette: Team Members
  ```
    Team Leader:
    - Daniela Grumbach Kinder

    Team Member:
    - Tommy Cote
    - Daniel Foti
    - Gabriel Rioux
    - Maxime Lachance
    - Etienne G.Lapointe
  ```
---
## :warning: The Prerequisites To Run The App (Skip If On The Website)

- Ruby `v2.6.6`
- Rails `v5.2.4.5`
- Ubuntu
- MySQL
- PostgreSQL
> The rest is included in the gemFile
---
## :grey_exclamation: First thing to do

- Once you have cloned the repo, the first thing you should run in your terminal is: `bundle`

> This will get and update the required gems

---
## :pencil2: To Setup The Database
- Once you have edited your database.yml with the correct infos :arrow_heading_down:
- Run the following command: `rails db:setup`

![](https://github.com/CoteTommy/CoteTommy/blob/main/runDbSetup.gif?raw=true)

> That step created the database, migrated, and seeded it

---

## :pencil2: To Run The Application
- To start the rails server you need to run the following command: `rails s`

![](https://github.com/CoteTommy/CoteTommy/blob/main/runRailsServer.gif?raw=true)

> This started the rails server on localhost:3000

---

## :large_blue_circle: Now That The Server Is Running

- You can access the website by going to the following URL `http://localhost:3000/`

- Then you can login by clicking the button on the top right
![](https://github.com/CoteTommy/CoteTommy/blob/main/topnav.png?raw=true)

- User credentials :arrow_heading_down:

  1. Admin User :arrow_right: email: `admin@admin` password: `123456`
  2. Employee User :arrow_right: email: `The employee's email` password: `123456`

- To access the back office hover over your name at the right of the top nav bar  then click back office
---

### :small_blue_diamond:Some Extra Informations About The Project

#### This responsive website has:

- Quote system allowing the following:

  1. Creation of a new quote using the client's informations
  2. Saving the said quote in a new column inside the Quote table
  3. Linking the quotes to a user
  4. Being able to edit/delete the quote once logged in

```
first name;
last name;
encrypted password.
```
An Employees's table, reserved to authenticated users only, storing:

employee's user ID;
employee's last name;
employee's first name;
his/her title or function;
users attached to his/her profile.
A Back Office, the administrative section, that:

is secured behind an authentication page, validated using the users table;
stores the quotes.
How the Back Office works, the complete progress of a submission:

creation of a submission, by filling the quote's avaiable fields for each interest (Residential, Commercial, Corporative, Hybrid);
by loging in on his/her own account, the employee have access of his/her client's (users) informations (sauf the client's password) and also to have access to the client's quotes informations;
in the Back Office the employee can create, modify or delete the client's informations and/or any quotes wanted.


---

COMPANY
-------
Rocket Elevators


AUTHOR: 
-------
## Team #4

Team Leader:
- Daniela Grumbach Kinder

Team Member:
- Etienne G.Lapointe
- Gabriel Rioux
- Maxime Lachance
- Tommy Cote



# Rocket_Elevators_Information_System

## Team #4
```
Team Leader:
- Daniela Grumbach Kinder

Team Member:
- Etienne G.Lapointe
- Gabriel Rioux
- Maxime Lachance
- Tommy Cote
```

This is a responsive website for Rocket Elevators in Ruby on Rails architecture, MVC (Model - View - Controller), using MySQL for its database.

The link for the website is the following: https://tommycote.com/


This responsive website has:

  - A Quote table allowing:
    - users simulate a quote;
    - save quotes once loged in;
    - eventually permitting to turn the quotes into prospects.

  - A User's login page, allowing users to authenticate and also saving user's data such as:
    - first name;
    - last name;
    - encrypted password.

  - An Employees's table, reserved to authenticated users only, storing:
    - employee's user ID;
    - employee's last name;
    - employee's first name;
    - his/her title or function;
    - users attached to his/her profile.

  - A Back Office, the administrative section, that:
    - is secured behind an authentication page, validated using the users table;
    - stores the quotes.


How the Back Office works, the complete progress of a submission:
 - creation of a submission, by filling the quote's avaiable fields for each interest (Residential, Commercial, Corporative, Hybrid);
 - by loging in on his/her own account, the employee have access of his/her client's (users) informations (sauf the client's password) and also to have access to the client's quotes informations;
 - in the Back Office the employee can create, modify or delete the client's informations and/or any quotes wanted.


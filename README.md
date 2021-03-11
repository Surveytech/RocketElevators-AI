# Rocket Elevators Information System

---

## :busts_in_silhouette: Team Members
  ```
    Team Leader:
    - Tommy Cote

    Team Member:
    - Felix Masse
    - Charles Hall
    - Marie-Eve Goupil
  ```
---

## :construction: W.I.P :construction:

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
#### API integrated

- Google Maps API
  - It display our customer information based on the geolocalisation of their buiding in our database
  - It is only accesible trough the admin sectio on the site


- Twilio API
  - When an elevator status change to "Intervention" the building's technical contact will recieved a SMS

-  Slack API
    - When an elevator's status change, a message is sent to the slack channel 'elevator_operation'.
    - This leave a written record of the elevators activity

- Dropbox API:
    - When a contact becomes a customers the binary document save in the database is uploaded to dropbox.
    - Then the database is cleared of this document.

- Sendgrid API:
    - When a contact complete a "Contact Us" form a confirmation email is send to the provided contact's email.


- IBM Watson API:
    - When an user loggin in the admin page the autorize user can play an audio file with the following info:
        The type of information that speech synthesis allows are the following:
        Greetings to the logged users
        There are currently XXX elevators deployed in the XXX buildings of your XXX customers
        Currently, XXX elevators are not in Running Status and are being serviced
        You currently have XXX quotes awaiting processing
        You currently have XXX leads in your contact requests
        XXX Batteries are deployed across XXX cities
    - Those info are dynamic and change when the admin page is loaded.


- ZenDesk API:
    - The ZenDesk platform can be powered by a call to the API and the software can then process requests depending on the type.
      - The website's “Contact Us” form creates a new “Question” type ticket in ZenDesk
      - The website's “Get a Quote” form creates a new “Task” type ticket in ZenDesk
      - The tickets created are visible in the ZenDesk Console and it is possible to respond to them or even manage a workflow for these contacts.



## :construction: THE REST IS W.I.P :construction:

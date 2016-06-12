# pok-dexEE

Requirements:

EJB
---

* At least one stateless and one stateful EJB session bean [v]
	-> Stateful bean: Cart aanpassen

* At least one Singleton bean [v]
	-> featured pokemon

* At least one interceptor
	-> Logger

* At least one timer [v]
	-> featured pokemon

* A SOAP web service [v]
	-> Pokemon returner

* A RESTFul web service []
	-> Pokemon returner

JPA
---

* A few entity beans, with at least a one-to-many [~] and a many-to-many [v] relationship
	-> one to many evolves into: groups (Vincent)

* Corresponding tables [?]

* Some "special" JPA annotations (make a selection yourself) []
    (@Enumerated
    @Elementcollection
    @Inheritance
    @Embeddable/@Embedded)

Web-client
----------

* One Servlet [v]

* One Filter [v]

* Framework: the choice is up to you
    * Page flow
    * Form & validation & business logic
	-> Vincent

* Web service clients
    * One client for your own web services
        * One SOAP client [v]
        * One client for the RESTFul service (Json or XML) []
	-> Same as above

    * One client for another web service, somewhere... [v]
	-> pokéapi

* Web framework evaluation: use the template (MVC.html) to fill in your findings

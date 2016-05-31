# pok-dexEE

Requirements:

EJB
---

* At least one stateless [v] and one stateful [] EJB session bean
	-> Stageful bean: Cart aanpassen
* At least one Singleton bean
	-> 
* At least one interceptor
	-> Logger
* At least one timer
	-> experience incrementer
* --A MDB (Message Driven Bean) with a Message Queue (and some code that posts a message in the queue)--
* A SOAP web service
	-> Pokemon returner
* A RESTFul web service
	-> Pokemon returner

JPA
---

* A few entity beans, with at least a one-to-many [] and a many-to-many [v] relationship
	-> one to many evolves into: evee in vaporeon, jolted en flareon (Vincent)
* Corresponding tables
* Some "special" JPA annotations (make a selection yourself)
    (@Enumerated
    @Elementcollection
    @Inheritance
    @Embeddable/@Embedded)

Web-client
----------

- [v] One Servlet 
- [v] One Filter 
* Framework: the choice is up to you
    * Page flow
    * Form & validation & business logic
	-> Vincent

* Web service clients
    * One client for your own web services
        * One SOAP client
        * One client for the RESTFul service (Json or XML)
	-> Same as above
    * One client for another web service, somewhere...
	-> ?

* Web framework evaluation: use the template (MVC.html) to fill in your findings

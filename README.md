# pok-dexEE

Requirements:

EJB
---

* At least one stateless and one stateful EJB session bean
* At least one Singleton bean
* At least one interceptor
* At least one timer
* A MDB (Message Driven Bean) with a Message Queue (and some code that posts a message in the queue)
* A SOAP web service
* A RESTFul web service

JPA
---

* A few entity beans, with at least a one-to-many and a many-to-many relationship
* Corresponding tables
* Some "special" JPA annotations (make a selection yourself)
    (@Enumerated
    @Elementcollection
    @Inheritance
    @Embeddable/@Embedded)

Web-client
----------

* One Servlet
* One Filter
* Framework: the choice is up to you
* Page flow
* Form & validation & business logic
* Web service clients

* One client for your own web services
    * One SOAP client
    * One client for the RESTFul service (Json or XML)
* One client for another web service, somewhere...

* Web framework evaluation: use the template (MVC.html) to fill in your findings

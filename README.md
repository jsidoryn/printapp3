# Print Flow Documentation

## High level overview

The aim of the application is to smooth out the workflow for designers working with printers. 

Currently the process is something like: 
* Client briefs Designer on job
* Designer writes up a job spec and emails to multiple Printers
* Printer may have questions etc that come by phone and job spec may need to be altered
* Designer may need to chase up Printer if haven’t received quote
* Printer submits quote
* Designer re-writes quote with their % markup
* Designer submits quote to Client
* Client approves quote
* In the future a client may want a reprint and all the information is stored in emails and PDF’s. Often just starting from scratch is easier. 
*  Also there’s future workflow for print management (e.g. getting proofs, checking print runs etc) but out of scope at the moment. 

The app will keep this workflow all in one place. 

## User management

There are three types of organisations:
* Designers
* Printers
* Clients

The three organisation types have one or more users

Designers sign up and pay for the app

When a Designer signs up they will be the first user for the Designer organisation and assume they are the account holder (in charge of billing).

Printers will be pre-populated

A Designer should be able to select one or more Printers to send a quote to. The Designer should be able to see if their contact is associated to the Printer organisation and if not then they should be able to invite them. 

A Designer should be able to favourite Printers. 

A Designer should be able to add a Client (uniqueness? if two separate designers add the same client?)

A Designer should be able to invite users to a Client organisation. 

Clients and Printers should be able to manage users within their organisation (account holder?). 

## Jobs / Specifications / Quotes

Currently the models are set up so that Designer creates a Job that is associated with a Client. 

The Job is associated with one or more Specifications. 

The Specifications are sent to Printers

Printers submit quotes for each specification. 

Designers can also write quotes that they can choose to show to the client. 

## Simplified workflow / state

Here’s a basic workflow along with states assuming all organisations and users are in the system:
* Designer creates a Job and associates with a Client
* Designer writes a Specification (spec_state: new)
* Designer selects Printers to send the Specification to (spec_state: open)
* Printer receives notification by email that there’s a new Specification ready for them to review
* Printer logs in and views all open Specifications (across multiple Designers) and clicks to view this Specification
* Printer submits a Quote (quote_state: new)
* Designer reviews Quote, accepts (quote_state: accepted) and closes Specification (spec_state: closed) or this could happen automatically when a date passes. 
* Designer clones Quote and sends to client (spec_state: pending)

## Where I’m at

Progressing with Ruby and Rails

Haven’t had as much time as I’ve wanted spent some time on getting a better understanding of Active Record and how forms interact with them. 

Keep getting blocked by how best to set up users. 

Looking at either Clients, Designers, Printers all being separate organisations which all have users. This would be simpler as all separate but means that users will all have three columns for client_id, designer_id and printer_id. Could you polymorphism maybe but seems wrong. 

Thinking better to have an organisation that has users and then use STI to have types of Clients, Designers and Printers. 

Made a start on this but stopped as thought better to speak with you. 

I’m interested in how you would go about thinking through this problem and it would be good to do so together. 

I think I’m relatively comfortable with getting most of the rest of the features (although I’m sure some will come up) but this seems pretty fundamental and keen to dig deep.

# Yu_T-P1-3NF

## Website 

Website and website repository: 

- https://210927-reston-uipath.github.io/Yu_T-P1-website/
- https://github.com/210927-Reston-UiPath/Yu_T-P1-website/settings/pages

Website uses Bootstrap for template and layout:

- https://getbootstrap.com/

Website references the following repository for html/css/js code for adding items to cart:

- https://github.com/210927-Reston-UiPath/TindahanNiAlingNena

Website uses shutterstock for royalty-free stock images:

- https://www.shutterstock.com/

## MVP Functionalities

- [x] Robot should be able to take client shopping lists and place orders on the appropriate vendors
- [x] Robot should record the total expense of each shopping trip for each client
- [x] Robot should be able to record any items that were out of stock or not found
- [x] Robot should be able to add clients to the existing client list and take in their shopping order
- [x] Robot should shop from at least 2 vendors
  - 4 vendors (pega, stationeryshop, foodshop, beverageshop)
- [x] One of the vendors should be Pega
- [x] The other vendor should be a self made shop using HTML, CSS, and JS
## Stretch Goals
- [x] Sending emails to clients about their shopping order
- [x] Any other extra features that would improve UX
  - [x] Menu options:
    - [x] Delete clients, orders, vendor inventory
    - [x] View client info, totals, subtotals, items not found
- [ ] Send client expense report in excel format
## Constraints
- [x] Client information should be stored in a DB
- [x] Vendor information should be stored in a webpage
- [x] Expense Reports should be stored in a DB
- [ ] Automations should have exception handling enabled
  - [x] AddClient.xaml has exception handling for null values, numeric values, and for customers that don't have their own excel sheet with their name and their shopping list.
  - [x] EmailClient_EntireOrderOutOfStock.xaml handles an edge case to send out of stock emails to clients whose entire order was out of stock/unavailable. EmailClient does not handle this edge case by default.
- [x] DB tables should be 3NF
  - This repository is a refactor of my original attempt at P1 that didn't meet the 3NF tables constraint:
    - https://github.com/210927-Reston-UiPath/Yu_T-P1
## Tech Stack
- UiPath Studio
- PostgreSQL/SQL Server
- HTML, CSS, JS

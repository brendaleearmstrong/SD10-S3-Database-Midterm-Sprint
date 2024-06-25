# SD10-S3-Database-Midterm-Sprint
## NewfoundFitness - SD10-S3-SPRINT-1-DB Scenario
## Group: Brenda Armstrong/Ethan Murphy

Newfound Fitness – Scenario

A local commercial gym offers a wide range of fitness programs, exercise equipment, nutritional supplements, and classes to its members. The local gym only has one location, but offers a wide variety of services including: personal training, group fitness classes, and memberships. It also has other revenues of income such as selling workout supplements. Newfound Fitness is currently in the market for developing a database to better track their incoming revenue, staff, and membership information. By implementing this database system, they hope to optimize their resource allocation and improve member engagement by assessing data trends.

Like most businesses, Newfound Fitness will require a Point of Sale (PoS) system to keep track of both member and sales transactions. For the members, they pay their membership fees monthly and classes as they are needed. Workout supplements and protein shakes are also purchased through the same PoS system. Owners ultimately want to track inventory trends such as what products sell the most, what census is buying what product, and when products are being sold. They also want to keep track of what fitness classes are most popular and the age cohorts for each class. Knowing this information will help them better serve their clients and provide fitness options that are in line with their client’s needs.

Entities: • Location: Location of gym and future gyms. • Staff: Information about staff working at the gym including full name, salary, and employee number • Membership Plans: Information about all of the current offered plans for gym members. • Equipment: A complete inventory of all gym equipment including purchase date, muscle group, and maintenance schedule • Fitness classes: A list of current offered classes that describes the type of class, max capacity, and instructor • Supplements: complete list of supplements available • Receipt: information about sales to the member, this will include all information found on the receipt.

Note – other entities exist such as addresses, inventories, services employee has skills, etc. Consider these… make sample data in a spreadsheet, think it through, normalize.

# NewfoundFitness Database Backup Installation

This repository contains a backup of the NewfoundFitness PostgreSQL database. The backup includes all schema and data necessary to restore the database to its current state.

## Backup File

- **Filename:** `newfoundfitness_db.tar`
- **Format:** `tar`

## Contents

The backup includes the following:
- **Schema (Pre-data):** All table definitions, indexes, and other schema objects.
- **Data:** All data within the tables.
- **Schema (Post-data):** Additional schema modifications such as constraints and indexes.

## Restore Instructions

To restore the NewfoundFitness database from the backup file, follow these steps:

### Prerequisites

- PostgreSQL installed on your machine.
- Access to a PostgreSQL server.
- The `pg_restore` utility (comes with PostgreSQL).

### Steps to Restore

1. **Create a New Database:**
   First, create a new database in your PostgreSQL server where the backup will be restored.

   ```sql
   CREATE DATABASE newfoundfitness_db_restored;

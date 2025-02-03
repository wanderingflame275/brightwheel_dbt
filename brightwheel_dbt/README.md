# Writeup
**Tradeoffs you might have made, anything you left out, or what you might do differently if you were to spend additional time on the coding**
  - dbt Project Hygiene: I'd make the dbt project cohesive and proper with full configurations. There is some of it in the few `schema.yml` and `sources.yml` files I have, but with more time I'd:
    - make these configs for all models
    - add dbt tests
    - add table- and column- level descriptions
  - Model instantation: to answer some of the questions presented in the instructions, snapshots (type-2 data) are most appropriate to handle historical state shifts.
  - Referential integrity modeling: some of this data is pretty dirty. If phone number and address are the primary and secondary identifiers, I'd make it a very high priority to have a good `dim_addresses` model brought into the dbt project, and use the values in that table to help clean up the freeform text in the sources. For the bit of cleaning I did, I used regular expressions, but this should actually use regex on top of anchoring to a good source of truth.
  - I would not have chosen DuckDB, and probably would have swapped to a more formal database. I learned DuckDB is nice for one-offs or light data exploration, but piles of abstraction I can see getting out of hand relatively quick.

**Short write-up with ideas for longer term ETL strategies/processes.**
What is needed out of this data is fairly straightforward. What complicates this straightforward process is how messy freeform and manual entry data can be. Ideally, there is a software or precleaning step (extra human eyes are even good here) that tidies the raw data up before it is attempted to load into the data warehouse. Otherwise, early morning ELT/dbt project runs are liable to be stuck in a loop of failures all the tim, and there will be a lot of firefighting involved. For a longer-term strategy, I'd advocate throughout the org and company to add some structure to this data collection, where feasible.

If this can't be accomplished, a failsafe to make sure bad data does not taint full-project dbt runs is to have the data team validate themselves the data integrity of the raw files before the following day's early-morning runs (maybe this can be a 5PM process or something). If the data team sees that new/updated source files can't be loaded into tables in a contained schema/environment, then changes can be added where needed to the raw data before they're positioned to run throughout the rest of the dbt project. This way, the data team isn't having to worry about logging into work the following day and reacting to a firedrill because of malformed values all the way upstream in new source files.

**How you explored the data**
Both visually and through DuckDB. DuckDB let me run SELECTs against the downloaded raw files on my machine, and visually I got a sense of the granularity of each provided source file.

**Testing/data validation**
Since I had DuckDB and could run SQL against the 4 source files, I was able to run full dbt commands to build the project out, as well as explore granularity with `COUNT(DISTINCT $column_here)` commands.


# duckdb setup
_How to set up dbt and duckdb to use this basic dbt project and query csv files from the command line._
_(duckdb was selected because I had never used it before and I wanted to see how well it runs files locally)_

1. Install the duckdb dbt adapter: `pip install dbt-duckdb`
2. Install duckdb and its cli if it's not already on your machine - [I had to use the Windows flavor](https://duckdb.org/docs/installation/?version=stable&environment=cli&platform=win&download_method=package_manager)
3. Add duckdb to `profiles.yml`: `vim ~/.dbt/profiles.yml`
- Add this to the file:

```
brightwheel_dbt:
  outputs:
    dev:
      type: duckdb
      path: brightwheel
      threads: 1

    prod:
      type: duckdb
      path: prod.duckdb
      threads: 4

  target: dev
```

4. To validate, load duckdb and select from one of the preloaded database models:
```
duckdb brightwheel
```

```
select * from main.stg_source1;
```


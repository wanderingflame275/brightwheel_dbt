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


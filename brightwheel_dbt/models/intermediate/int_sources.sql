with source1 as (
  select
    replace(regexp_replace(phone, '[^0-9-]', ''), '-', '') as phone,
    trim(regexp_replace(address, '(.*),.*$', '\1')) as street_address,
    trim(regexp_replace(address, '.*,\s*([^,]+?)\s*[A-Z]{2}\s+[0-9]{5}.*$', '\1')) as city,
    upper(trim(state)) as state,
    trim(regexp_replace(address, '.*([0-9]{5}).*$', '\1')) as postal_code,
    upper(trim(name)) as school_name,
    trim(primary_contact_name) as contact_name,
    null as _salesforce_created_at_utc,
    _loaded_at,
    'source1.csv' as source_origin
  from {{ ref("stg_source1") }}
) /*,

source2 as (
  select
    replace(regexp_replace(phone, '[^0-9-]', ''), '-', '') as phone,
    trim(regexp_replace(address, '(.*),.*$', '\1')) as street_address,
    trim(regexp_replace(address, '.*,\s*([^,]+?)\s*[A-Z]{2}\s+[0-9]{5}.*$', '\1')) as city,
    upper(trim(state)) as state,
    trim(regexp_replace(address, '.*([0-9]{5}).*$', '\1')) as postal_code,
    upper(trim(name)) as school_name,
    trim(primary_contact_name) as contact_name,
    null as _salesforce_created_at_utc,
    _loaded_at,
    'source2.csv' as source_origin
  from {{ ref("stg_source2") }}
),

source3 as (
  select
    replace(regexp_replace(phone, '[^0-9-]', ''), '-', '') as phone,
    trim(regexp_replace(address, '(.*),.*$', '\1')) as street_address,
    trim(regexp_replace(address, '.*,\s*([^,]+?)\s*[A-Z]{2}\s+[0-9]{5}.*$', '\1')) as city,
    upper(trim(state)) as state,
    trim(regexp_replace(address, '.*([0-9]{5}).*$', '\1')) as postal_code,
    upper(trim(name)) as school_name,
    trim(primary_contact_name) as contact_name,
    null as _salesforce_created_at_utc,
    _loaded_at,
    'source3.csv' as source_origin
  from {{ ref("stg_source3") }}
),

salesforce_leads as (
  select
   -- to do
  from {{ ref("stg_salesforce_leads") }}
) */

select * from source1
/*union all
select * from source2
union all
select * from source3
union all
select * from salesforce_leads
*/
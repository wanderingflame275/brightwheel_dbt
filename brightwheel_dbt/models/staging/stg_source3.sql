{{ config (
    materialized = "view"
) }}

select
  operation,
  "Agency Number" as agency_number,
  "Operation Name" as operation_name,
  address,
  city,
  state,
  zip,
  county,
  phone,
  type,
  status,
  "Issue Date" as issue_date,
  capacity,
  "Email Address" as email_address,
  "Facility ID" as facility_id,
  "Monitoring Frequency" as monitoring_frequency,
  infant,
  toddler,
  preschool,
  school
from {{ source('raw', 'source3') }}
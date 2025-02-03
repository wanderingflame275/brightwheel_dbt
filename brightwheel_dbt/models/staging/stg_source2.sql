{{ config (
    materialized = "view"
) }}

select
  "Type License" as type_license,
  company,
  "Accepts Subsidy" as accepts_subsidy,
  "Year Round" as year_round,
  "Daytime Hours" as daytime_hours,
  "Star Level" as star_level,
  mon,
  tues,
  wed,
  thurs,
  friday,
  saturday,
  sunday,
  "Primary Caregiver" as primary_caregiver,
  phone,
  email,
  address1,
  address2,
  city,
  state,
  zip,
  "Subsidy Contract Number" as subsidy_contract_number,
  "Total Cap" as total_cap,
  "Ages Accepted 1" as ages_accepted_1,
  aa2,
  aa3,
  aa4,
  "License Monitoring Since" as license_monitoring_since,
  "School Year Only" as school_year_only,
  "Evening Hours" as evening_hours
from {{ source('raw', 'source2') }}
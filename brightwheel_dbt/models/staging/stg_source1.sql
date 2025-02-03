{{ config (
    materialized = "view"
) }}

select
  name,
  status,
  "credential type" as credential_type,
  "credential number" as credential_number,
  "expiration date" as expiration_date,
  "Disciplinary Action" as disciplinary_action,
  address,
  state,
  county,
  phone,
  "First Issue Date" as first_issue_date,
  "Primary Contact Name" as primary_contact_name,
  "Primary Contact Role" as primary_contact_role 
from {{ source('raw', 'source1') }}
{{ config (
    materialized = "view"
) }}

select
  id,
  is_deleted,
  last_name,
  first_name,
  title,
  company,
  street,
  city,
  state,
  postal_code,
  country,
  phone,
  mobile_phone,
  email,
  website,
  lead_source,
  status,
  is_converted,
  created_date,
  last_modified_date,
  last_activity_date,
  last_viewed_date,
  last_referenced_date,
  email_bounced_reason,
  email_bounced_date,
  outreach_stage_c,
  current_enrollment_c,
  capacity_c,
  lead_source_last_updated_c,
  brightwheel_school_uuid_c,
  _loaded_at
from {{ source('raw', 'salesforce_leads') }}
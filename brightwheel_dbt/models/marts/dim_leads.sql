select
  phone,
  street_address,
  city,
  state,
  postal_code,
  school_name,
  contact_name,
  _salesforce_created_at_utc,
  _loaded_at as _row_loaded_from_file_at_utc,
  source_origin
  from {{ ref("int_sources") }}
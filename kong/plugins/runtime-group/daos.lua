local typedefs = require "kong.db.schema.typedefs"

return {
  {
    ttl = false,
    primary_key = { "id" },
    name = "runtime_groups",
    endpoint_key = "name",
    cache_key = { "name" },
    workspaceable = false,
    admin_api_name = "runtime-groups",
    admin_api_nested_name = "runtime-group",
    fields = {
      { id = typedefs.uuid },
      { created_at = typedefs.auto_timestamp_s },
      { name = { type = "string", required = true, unique = true }, },
      { features = { type = "array", elements = { type = "string" } } },
      { hosts = { type = "array", elements = { type = "string" } } }
    },
  },
}
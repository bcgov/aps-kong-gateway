local typedefs = require "kong.db.schema.typedefs"

local acme_schema = require "kong.plugins.acme.schema"
local prometheus_schema = require "kong.plugins.prometheus.schema"
local httplog_schema = require "kong.plugins.http-log.schema"

local service = require "kong.db.schema.entities.services"
local route = require "kong.db.schema.entities.routes"

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
      { namespaces = { type = "array", elements = { type = "string" } } },
      { acme_plugin = { type = "record", required = false, fields = {
        { plugin = { type = "record", fields = acme_schema.fields } },
        { service = { type = "record", fields = service.fields }},
        { route = { type = "record", fields = route.fields }},
      } } },
      { prom_plugin = { type = "record", fields = {
        { plugin = { type = "record", fields = prometheus_schema.fields }},
        { service = { type = "record", required = false, fields = service.fields }},
        { route = { type = "record", required = false, fields = route.fields }},
      } } },
      { logs_plugin = { type = "record", fields = {
        { plugin = { type = "record", fields = httplog_schema.fields }},
      } } },
    },
  },
}

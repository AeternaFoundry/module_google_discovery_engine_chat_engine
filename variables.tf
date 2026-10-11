variable "discovery_engine_chat_engines" {
  description = <<EOT
Map of discovery_engine_chat_engines, attributes below
Required:
    - collection_id
    - data_store_ids
    - display_name
    - engine_id
    - location
    - chat_engine_config (block):
        - agent_creation_config (optional, block):
            - business (optional)
            - default_language_code (required)
            - location (optional)
            - time_zone (required)
        - allow_cross_region (optional)
        - dialogflow_agent_to_link (optional)
Optional:
    - deletion_policy
    - industry_vertical
    - project
    - common_config (block):
        - company_name (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    collection_id     = string
    data_store_ids    = list(string)
    display_name      = string
    engine_id         = string
    location          = string
    deletion_policy   = optional(string)
    industry_vertical = optional(string)
    project           = optional(string)
    chat_engine_config = object({
      agent_creation_config = optional(object({
        business              = optional(string)
        default_language_code = string
        location              = optional(string)
        time_zone             = string
      }))
      allow_cross_region       = optional(bool)
      dialogflow_agent_to_link = optional(string)
    })
    common_config = optional(object({
      company_name = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


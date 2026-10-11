resource "google_discovery_engine_chat_engine" "discovery_engine_chat_engines" {
  for_each = var.discovery_engine_chat_engines

  collection_id     = each.value.collection_id
  data_store_ids    = each.value.data_store_ids
  display_name      = each.value.display_name
  engine_id         = each.value.engine_id
  location          = each.value.location
  deletion_policy   = each.value.deletion_policy
  industry_vertical = each.value.industry_vertical
  project           = each.value.project

  chat_engine_config {
    dynamic "agent_creation_config" {
      for_each = each.value.chat_engine_config.agent_creation_config != null ? [each.value.chat_engine_config.agent_creation_config] : []
      content {
        business              = agent_creation_config.value.business
        default_language_code = agent_creation_config.value.default_language_code
        location              = agent_creation_config.value.location
        time_zone             = agent_creation_config.value.time_zone
      }
    }
    allow_cross_region       = each.value.chat_engine_config.allow_cross_region
    dialogflow_agent_to_link = each.value.chat_engine_config.dialogflow_agent_to_link
  }

  dynamic "common_config" {
    for_each = each.value.common_config != null ? [each.value.common_config] : []
    content {
      company_name = common_config.value.company_name
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


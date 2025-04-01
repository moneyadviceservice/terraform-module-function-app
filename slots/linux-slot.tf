resource "azurerm_linux_web_app_slot" "main" {
  count = lower(var.os_type) == "linux" ? 1 : 0

  name           = "func-${var.name}-staging-slot"
  app_service_id = var.id

  public_network_access_enabled = var.public_network_access_enabled
  virtual_network_subnet_id     = var.subnet_id != null ? var.subnet_id : null

  dynamic "site_config" {
    for_each = [var.site_config]
    content {
      linux_fx_version = lookup(site_config.value, "linux_fx_version", null)

      container_registry_managed_identity_client_id = lookup(site_config.value, "container_registry_managed_identity_client_id", null)
      container_registry_use_managed_identity       = lookup(site_config.value, "container_registry_use_managed_identity", null)

      always_on                         = lookup(site_config.value, "always_on", null)
      app_command_line                  = lookup(site_config.value, "app_command_line", null)
      default_documents                 = lookup(site_config.value, "default_documents", null)
      ftps_state                        = lookup(site_config.value, "ftps_state", "Disabled")
      health_check_path                 = lookup(site_config.value, "health_check_path", null)
      health_check_eviction_time_in_min = lookup(site_config.value, "health_check_eviction_time_in_min", null)
      http2_enabled                     = lookup(site_config.value, "http2_enabled", null)
      local_mysql_enabled               = lookup(site_config.value, "local_mysql_enabled", false)
      managed_pipeline_mode             = lookup(site_config.value, "managed_pipeline_mode", null)
      minimum_tls_version               = lookup(site_config.value, "minimum_tls_version", lookup(site_config.value, "min_tls_version", "1.2"))
      remote_debugging_enabled          = lookup(site_config.value, "remote_debugging_enabled", false)
      remote_debugging_version          = lookup(site_config.value, "remote_debugging_version", null)
      use_32_bit_worker                 = lookup(site_config.value, "use_32_bit_worker", false)
      websockets_enabled                = lookup(site_config.value, "websockets_enabled", false)

      ip_restriction_default_action     = lookup(site_config.value, "ip_restriction_default_action", "Deny")
      # scm_ip_restriction_default_action = lookup(site_config.value, "scm_ip_restriction_default_action", "Deny")
      # scm_type                          = lookup(site_config.value, "scm_type", null)
      # scm_minimum_tls_version           = lookup(site_config.value, "scm_minimum_tls_version", "1.2")
      # scm_use_main_ip_restriction       = length(var.scm_allowed_cidrs) > 0 || var.scm_allowed_subnet_ids != null ? false : true

      vnet_route_all_enabled = var.enable_vnet_integration == true ? true : null

      dynamic "application_stack" {
        for_each = lookup(site_config.value, "application_stack", null) == null ? [] : ["application_stack"]
        content {
          docker_image_name        = lookup(var.site_config.application_stack, "docker_image_name", null)
          docker_registry_url      = lookup(var.site_config.application_stack, "docker_registry_url", null)
          docker_registry_username = lookup(var.site_config.application_stack, "docker_registry_username", null)
          docker_registry_password = lookup(var.site_config.application_stack, "docker_registry_password", null)
          dotnet_version           = lookup(var.site_config.application_stack, "dotnet_version", null)
          java_server              = lookup(var.site_config.application_stack, "java_server", null)
          java_server_version      = lookup(var.site_config.application_stack, "java_server_version", null)
          java_version             = lookup(var.site_config.application_stack, "java_version", null)
          node_version             = lookup(var.site_config.application_stack, "node_version", null)
          php_version              = lookup(var.site_config.application_stack, "php_version", null)
          python_version           = lookup(var.site_config.application_stack, "python_version", null)
          ruby_version             = lookup(var.site_config.application_stack, "ruby_version", null)
        }
      }

    }
  }

  app_settings = var.app_settings

  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = lookup(connection_string.value, "name", null)
      type  = lookup(connection_string.value, "type", null)
      value = lookup(connection_string.value, "value", null)
    }
  }

  client_affinity_enabled = var.client_affinity_enabled
  https_only              = var.https_only
}

    
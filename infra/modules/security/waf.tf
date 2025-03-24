resource "aws_wafv2_web_acl" "main" {
  name        = "web_acl"
  scope       = "REGIONAL" 
  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "webAclMetric"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "allow-rule"
    priority = 1
    action {
      allow {}
    }
    statement {
      byte_match_statement {
        search_string = "bad-request"
        field_to_match {
          body {}
        }
        positional_constraint = "EXACTLY"  
        text_transformation {
          priority = 0
          type     = "NONE" 
        }
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "allow-rule-metric"
      sampled_requests_enabled   = true
    }
  }
}

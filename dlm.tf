resource "aws_dlm_lifecycle_policy" "daily_snapshot_policy" {
    description        = "Daily"
    execution_role_arn = aws_iam_role.dlm_role.arn

    policy_details {
        resource_types = ["VOLUME"]
        
        schedule {
            name = "daily-schedule"
            
            create_rule {
                interval      = 24
                interval_unit = "HOURS"
                times         = ["01:00"]  // Set snapshot creation time to 1:00 AM UTC
            }

            retain_rule {
                count = 1
            }

            tags_to_add {
                SnapshotCreator = "Terraform"
            }
        }

        target_tags = {
            "DataLifecycleManagerSnapshotPolicyDaily" = "Yes"
        }
    }
}

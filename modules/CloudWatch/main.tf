# Creating the CloudWatch alarm
resource "aws_cloudwatch_metric_alarm" "CPUalarm" {
  alarm_name          = "terraform_alarm_test"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors the EC2 CPU utilization"
  treat_missing_data  = "breaching"
  alarm_actions = [ aws_sns_topic.sns_topic.arn ]

  dimensions = {
    InstanceId = var.EC2_id
  }

}

# Creating SNS topic that sends email upon breach 

resource "aws_sns_topic" "sns_topic" {
  name = "CPU_breach_Terraform"
}

resource "aws_sns_topic_subscription" "email_target" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = "fedqyas@gmail.com"
}



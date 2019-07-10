resource "aws_sns_topic" "dmoshi_contactme_sns" {
  name = "contact_me_topic"
}
 

resource "aws_sns_topic_subscription" "dmoshi_contactme_target" {
  topic_arn = "${aws_sns_topic.dmoshi_contactme_sns.arn}"
  protocol  = "sms"
  endpoint  = "${var.ENDPOINT_ADDRESS}"
}
variable "bucket_name" {
  type    = string
}

variable "name" {
  type = string
  default = "MykBucket"
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "status" {
  type    = string
  default = "Enabled"
}

variable "id" {
  type    = string
  default = "rule-1"
}


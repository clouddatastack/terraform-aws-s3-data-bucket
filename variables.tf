variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Allow destroying non-empty bucket"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "enable_versioning" {
  description = "Enable versioning on the bucket"
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "SSE algorithm (AES256 or aws:kms)"
  type        = string
  default     = "AES256"
}

variable "kms_key_id" {
  description = "Optional KMS key ARN"
  type        = string
  default     = null
}

variable "lifecycle_rules" {
  description = "List of lifecycle rules (raw expiration, processed archive)"
  type = list(object({
    id                       = string
    prefix                   = string
    expiration_days          = optional(number)
    transition_days          = optional(number)
    transition_storage_class = optional(string)
  }))
  default = []
}

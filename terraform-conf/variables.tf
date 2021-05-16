variable "ipaddr_gitlab" {
  description = "internal IP of Gitlab server"
  type        = string
  default = "192.168.2.28"
}

variable "minio_server" {
  description = "Default MINIO host and port"
  type        = string
  default = "192.168.2.24:9000"
}

variable "minio_region" {
  description = "minio_server"
  type        = string
  default = "us-east-1"
}
variable "minio_access_key" {
  description = "minio_access_key"
  type        = string
  default = "minio"
}
variable "minio_secret_key" {
  description = "minio_secret_key"
  type        = string
  default = "miniosecret"
}
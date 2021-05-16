terraform {
  backend "s3" {
    endpoint = "http://192.168.2.24:9000"
    key = "terraform.tfstate"
    bucket = "web-acedemy"
    region = "main"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_region_validation = true
    force_path_style = true
    access_key = "minio"
    secret_key = "miniosecret"
  }
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.6.0"
    }
    minio = {
      source = "aminueza/minio"
      version = ">= 1.0.0"
    }
  }
}

provider "minio" {
  minio_server = var.minio_server
  minio_region = var.minio_region
  minio_access_key = var.minio_access_key
  minio_secret_key = var.minio_secret_key
}

resource "minio_iam_user" "minio_user" {
  name = "minio_user"
}

resource "minio_s3_bucket" "state_terraform_s3" {
  bucket = "state-terraform-s3"
  acl    = "public"
}

resource "minio_s3_object" "txt_file" {
  depends_on = [minio_s3_bucket.state_terraform_s3]
  bucket_name = minio_s3_bucket.state_terraform_s3.bucket
  object_name = "text.txt"
  content = "Lorem ipsum dolor sit amet."
}

provider "gitlab" {
  # Configuration options
  #base_url = "http://192.168.2.28/api/v4"
  base_url = join("", [
    "http://",
    var.ipaddr_gitlab,
    "/api/v4"])
  token = "td_Ndq_j6Egw4s1F_EUz"
}

resource "gitlab_user" "terraform_created" {
  email = "test@gmail.com"
  name = "terraform1"
  password = "gotovfpf"
  username = "terraform1"
  can_create_group = true
}

resource "gitlab_group" "terraform_group" {
  name = "terraform_group"
  path = "terraform_gp"
}

resource "gitlab_project" "web-academy" {
  name = "web-academy"
}

resource "gitlab_project" "feature_login" {
  name = "feature_login"
}



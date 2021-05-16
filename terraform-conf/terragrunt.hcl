remote_state {
  backend = "s3"
  config = {
    address = "http://192.168.2.24:9000"
    scheme  = "http"
    path    = "${path_relative_to_include()}/terraform.tfstate"
    lock    = true
  }
}

inputs = {
  aws_region                       = "main"
  terraform_remote_state_file_name = "terraform.tfstate"
  vault_address                    = "http://192.168.2.24:9000"
}

include {
  path = "./"
}
terraform {
  backend "s3" {
    # Managed at https://github.com/mi-wada/tf-playground/blob/206c7c0d74fb093e1deca2c8db2fa4c569fb0b2a/s3backend/main.tf#L45-L47
    bucket       = "tf-state-03d7dc79-74e1-4100-b66e-55d830971e7b"
    key          = "terraform.d734e537-0bb3-45cb-aa37-28f2852dc08d.tfstate"
    region       = "ap-northeast-1"
    use_lockfile = true
  }
}

variable "tenancy_ocid" {
  type    = string
  default = null
}

variable "user_ocid" {
  type    = string
  default = null
}

variable "fingerprint" {
  type    = string
  default = null
}

variable "private_key_path" {
  type    = string
  default = null
}

variable "private_key" {
  type    = string
  default = null
}

variable "region" {
  type    = string
  default = null
}

variable "compartment_ids" {
  type    = map(any)
  default = null
}

variable "vcn_cidrs" {
  type    = list(any)
  default = ["10.0.0.0/16", "172.16.0.0/16", "192.168.0.0/16"]
}


variable "vcn_cidr" {
  type    = string
  default = "172.16.0.0/24"
}

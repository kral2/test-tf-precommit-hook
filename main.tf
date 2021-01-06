/*
Last update : February, 2020
Author: cetin.ardal@oracle.com
Description: Deploy a vcn
*/

resource "oci_core_vcn" "test_vcn" {
  #Required
  compartment_id = var.compartment_ids["test"]
  #Optional
  # cidr_block    = var.vcn_cidr
  # display_name  = "VCN-TFCLOUD_${var.vcn_cidr}"
  cidr_blocks  = var.vcn_cidrs[*]
  display_name = "VCN-TFCLOUD_${var.vcn_cidrs[0]}"
  dns_label    = "test"
  freeform_tags = {
    "Terraformed" = local.formatted_timestamp
    "TF-Module"   = local.tf-module
  }

  lifecycle {
    # only literal values below. Don't try to put any arbitrary expression evaluation, it is not authorized, by design.
    prevent_destroy = false
    ignore_changes = [
      freeform_tags["Terraformed"], # this prevents update on each apply and reduce noice
      defined_tags,
    ]
  }
}

locals {
  formatted_timestamp = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  tf-module           = "N/A"
}

# Reusable S3 Bucket Module for Data Platforms

This Terraform module provisions an S3 bucket with versioning, encryption, lifecycle policies, and public access blocking — ideal for staging raw, processed, or curated datasets in data lake setups.

## How to Use

```hcl
module "my_data_lake_bucket" {
  source           = "modules/s3_bucket"
  bucket_name      = "mycompany-dataset"
  enable_versioning = true

  lifecycle_rules = [
    {
      id              = "expire-raw"
      prefix          = "dataset/raw/"
      expiration_days = 30
    },
    {
      id                      = "archive-processed"
      prefix                  = "dataset/processed/"
      transition_days         = 180
      transition_storage_class = "GLACIER"
    }
  ]
}
```

---

## Contributing

Feel free to submit issues or pull requests to improve this repository.

---

## License

This project is licensed under the MIT License.
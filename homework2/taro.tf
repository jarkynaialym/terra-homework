
resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "bucket1" {
  bucket  = "kaizen-jarkynai"

}

resource "aws_s3_bucket" "bucket2" {
  bucket_prefix = "kaizen-"
  force_destroy = true

}

resource "aws_s3_bucket" "bucket3"{
 bucket = "luccky-bucky"

}

resource "aws_s3_bucket" "bucket4"{
 bucket = "buccky-lucky"

}



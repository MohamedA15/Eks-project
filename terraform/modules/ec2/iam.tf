resource "aws_iam_role" "bastion" {
  name = "${var.name}-bastion-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Allow bastion to query EKS cluster info 
resource "aws_iam_role_policy" "eks_cluster" {
  name = "${var.name}-eks-cluster"
  role = aws_iam_role.bastion.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_managed" {
  role       = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "bastion" {
  name = "${var.name}-bastion-profile"
  role = aws_iam_role.bastion.name
}


resource "aws_iam_role_policy" "terraform_state_s3" {
  name = "${var.name}-terraform-state-s3"
  role = aws_iam_role.bastion.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # Allow listing the bucket
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = "arn:aws:s3:::eks-terraform-state-mo"
      },

      # Allow read/write state + lock file
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::eks-terraform-state-mo/eks/terraform.tfstate",
          "arn:aws:s3:::eks-terraform-state-mo/eks/terraform.tfstate.tflock"
        ]
      }
    ]
  })
}

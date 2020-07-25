# infra_test

## ディレクトリ構成

```bash
.
└┬── aws      : AWS構築ディレクトリ
 ├── frontend : ALBを始めとしたフロントエンドに属するリソースを管理
 └── network  : VPC,Subnet(private/public),IGWを管理
```

---

## Install Applications

### Terraform

#### Install tfenv

https://github.com/tfutils/tfenv

```bash
$ brew install tfenv
$ tfenv install 0.12.29
```

#### Terraform Version

```bash
$ terraform --version
Terraform v0.12.29
```

---

### ステートバケットの作成(各環境作成時のみ)

ステートバケットの作成ステートバケットの作成は、次のようにAWSCLIで行います。

```bash
$ aws s3api create-bucket --bucket infratest-dev-terraform-tfstates \
    --create-bucket-configuration LocationConstraint=ap-northeast-1
```

次にバージョニング設定です。

```bash
$ aws s3api put-bucket-versioning --bucket infratest-dev-terraform-tfstates \
$ aws s3api put-bucket-versioning --bucket infratest-dev-terraform-tfstates \
    --versioning-configuration Status=Enabled
```

さらに暗号化も設定します。

```bash
$ aws s3api put-bucket-encryption --bucket infratest-dev-terraform-tfstates --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
```

最後にブロックパブリックアクセスを設定します。




```bash
$ aws s3api put-public-access-block --bucket infratest-dev-terraform-tfstates \
    --public-access-block-configuration '{
        "BlockPublicAcls": true,
        "IgnorePublicAcls": true,
        "BlockPublicPolicy": true,
        "RestrictPublicBuckets": true
    }'
```

これでステートバケットの準備は完了です。

---

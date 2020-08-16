# infra環境

## ディレクトリ構成

```bash
.
├── modules
│   ├── iam
│   └── security_group
└── environments
    ├── development
    │   └── ...
    ├── staging
    │   └── ...
    └── production
        └── ...
```

---

## Install Applications

### Terraform Version

```bash
$ terraform --version
Terraform v0.12.29
```

---

### ステートバケットの作成

ステートバケットの作成ステートバケットの作成は、次のようにAWSCLIで行います。

```bash
$ aws s3api create-bucket --bucket 【バケット名】 \
    --create-bucket-configuration LocationConstraint=ap-northeast-1
```

次にバージョニング設定です。

```bash
$ aws s3api put-bucket-versioning --bucket 【バケット名】 \
$ aws s3api put-bucket-versioning --bucket 【バケット名】 \
    --versioning-configuration Status=Enabled
```

さらに暗号化も設定します。

```bash
$ aws s3api put-bucket-encryption --bucket 【バケット名】 --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
```

最後にブロックパブリックアクセスを設定します。

```bash
$ aws s3api put-public-access-block --bucket 【バケット名】 \
    --public-access-block-configuration '{
        "BlockPublicAcls": true,
        "IgnorePublicAcls": true,
        "BlockPublicPolicy": true,
        "RestrictPublicBuckets": true
    }'
```

これでステートバケットの準備は完了です。

---

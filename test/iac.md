# IaC - Infrastructure as Code

- 비용 절감
- 배포 속도 향상
- 오류 감소
- 인프라 일관성 향상
- 구성 변동 제거

---

| 구분 | Terraform | CloudFormation | Ansible | Chef | Puppet |
| :--: | --- | --- | --- | --- | --- |
| Language | 선언형 | 선언형 | 절차형 | 절차형 | 선언형 |
| Infrastructure | 불변 | 불변(부분적 가변) | 가변 | 가변 | 가변 |
| Type | 프로비저닝 | 프로비저닝 | 구성 관리 | 구성 관리 | 구성 관리 |
| Architecture | 클라이언트 | 클라이언트 | 클라이언트 | 클라이언트<br>마스터 | 클라이언트<br>마스터 |
| File Language | HCL | YAML<br>JSON | YAML | RubyDSL | PuppetDSL |
| Enterprise | O | AWS Enterprise | O | O | O |

---

## Ansible

- 구성 관리
  - Configuration Management
  - 서버, 소프트웨어 상태 설정 및 유지 관리 초점
- 절차형
  - Imperative
  - 리소스 생성을 위해 모든 절차에 대한 스크립트 작성

---

## Terraform

- 프로비저닝
  - Orchestration
  - 인프라 리소스 생성에 초점
- 선언형
  - Declarative
  - 생성할 리소스에 대해 명시

### tfstate backend

- 테라폼으로 적용한 인프라 상태를 저장
- tfstate 파일 손실 발생 시 복구 작업이 어려움
- 기본적으로 로컬에 저장되며 여러 명이 협업 시 무결성에 문제 발생할 가능성 높음
- backend 설정으로 tfstate 파일을 공유 가능한 위치에 저장하여 협업
  - git을 이용하여 tfstate 파일 관리 시 pull/push 누락 및 동시 작업 등으로 충돌 발생 가능성 높으며 tfstate 파일에 기재되아 있는 DB 비밀번호, 계정 액세스 ID 등에 대한 보안에 취약
  - 공유 가능한 원격지 s3, google cloud storage, azure, terraform enterprise 등을 이용하여 협업 시 tfstate 무결성을 유지

### terraform cli example

```shell
terraform init -backend-config="dev-backend.conf"
terraform workspace list
terraform workspace show
terraform workspace new dev
terraform apply -var-file="dev-var.tfvars"
```

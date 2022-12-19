## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

## ordersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| address       | string     | null: false                    |
| delivery_time | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## itemsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| content | text       | null: false                    |
| price   | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| order   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order
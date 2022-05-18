# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#テーブル設計

## usersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| email                 | string     | null: false, unique: true      | 
| encrypted_password    | string     | null: false                    |
| school_id             | integer    | null: false                    |
| class_id              | integer    | null: false                    |
| grade_id              | integer    | null: false                    |
| name_first_name       | string     | null: false                    |
| name_last_name        | string     | null: false                    |
| name_first_name_kana  | string     | null: false                    |
| name_last_name_kana   | string     | null: false                    |
| group_id              | integer    | null: false                    |

### Association
- has_many :reservations

## reservationsテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| day                    | date       | null: false                    | 
| time                   | string     | null: false                    |
| start_time             | datetime   | null: false                    |
| style_id               | integer    | null: false                    |
| number_of_people_id    | integer    | null: false                    |
| question               | text       |                                |
| user                   | references | foreign_key: true              |

### Association
- belongs_to :user


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

##　usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| occupation|text   | null: false |
| profile  | text   | null: false |
| position |text    | null: false |

## prototyoes テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| catch_copy | text   | null: false |
| concept |text    | null: false |
| user | references | null: false, foreign_key: true |

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| profile  | text   | null: false |
| user   | references | null: false, foreign_key: true |
| prototype  | references | null: false, foreign_key: true |

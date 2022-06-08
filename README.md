# アプリケーション名
CORA -COnsultation Reservation Application-

## アプリケーション概要
---
面談などを予約管理できるアプリケーションです。

![トップ画面](../images/cora_top.png)
![新規予約画面](../images/cora_newreservation.png)

## URL
---
https://cora-37871.herokuapp.com/

## テスト用アカウント
---
メールアドレス：kobashi-takuro@sample.com
  パスワード：kobashitakuro2
  
## 使用言語、環境、テクノロジー
---
Ruby on Rails v6.0
JavaScript
GitHub
  
## 利用方法
---
 ユーザー新規登録・ログイン後、  トップページのカレンダーからご希望の日にちの◯印をクリックし、<br>申込内容入力画面にて必要事項を入力・選択してください。
<br><br>
【入力項目】
- 日付 (先程選んだ日にちがデフォルトで入力されています)
- 開始時刻<br>
    表の中からご希望の時間帯の「◯」をクリックしてください。
    <br>「×」となっている時間帯は選ぶことができません。
- ご参加予定人数（※）
    <br>プルダウンの中から該当の選択肢を選んでください。
- 面談形式（※）
    <br>プルダウンの中から該当の選択肢を選んでください。
- 備考・面談で相談したいこと
    <br>予約時に共有したいことがあれば記入してください。
  <br>
  入力した内容に間違いがないかを確認後、「申込」をクリックしてください。
  <br>
  <br>「申込が完了しました」という画面が表示されれば予約完了です。
  <br>申込完了と同時にユーザーが登録しているメールアドレスに申込完了メールを送信します。


## 目指した課題解決
---
  指導現場で依然として残る、紙で管理している面談などの予約をこのアプリケーションを通して電子化することで、  紙面の紛失やダブルブッキングなど、管理者による人為的なエラーを無くすことができます。

## 実装した機能についてのGIFと説明
---
- 新規予約機能
カレンダーより希望の日時を選んで、予約申し込みすることができます（入力内容確認機能を含む）
- マイページ機能
マイページでは予約の一覧や詳細を確認でき、一部内容の修正や予約をキャンセルすることができます。
- 予約詳細表示機能
予約した内容の詳細を表示することができます。
- 予約内容編集機能
予約した内容の一部を編集（変更）することができます。
- 予約削除機能
予約を削除することができます。
- メール送信機能
予約完了時・予約編集時にActionMailerが起動し、完了メールを送信することができます。
- Googleカレンダー登録機能
予約完了画面もしくは予約詳細表示画面から予約内容をGoogleカレンダーに登録することができます。

## 実装予定の機能
---
- 満席になった際にカレンダーに反映される機能
- モバイル端末からGoogleカレンダーに登録できる機能

## テーブル設計
---
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
| admin                 | boolean    |                                |


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

## ライセンス情報
---
MIT

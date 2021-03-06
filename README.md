# アプリケーション名
Youm!!!(ユーム)

# アプリケーション概要
自作メニュー投稿交流サイトです。
登録したユーザーは、自身の料理メニューをテキスト付きで投稿できます。
また、他のメニューを閲覧、購入、コメントを残すことができるSNSアプリケーションになります。

# URL
https://youm-app-1.herokuapp.com

# テスト用アカウント
mail: hoge@gmail.com
pass: combat

# ご利用方法
ご利用するためには、新規登録していただく必要があります。メールアドレスとパスワード(6文字以上)で
登録可能です。登録されますと、メニューを見ることができます。

投稿される際はプロフィールをご登録していただく必要があります。名前、一言、写真を入力するとプロフィール登録ができます。写真は無くてもダミー用がありますので登録されなくても大丈夫です。

メニューを投稿する際は、写真・メニュー名・メニューの説明・価格(300円〜9,999,999円以内)を入力してください。投稿するボタンを押すと投稿できます。

メニューの写真をクリックされますと、詳細が表示されます。この詳細ページではユーザーの方々は、自由にコメントをつけることができます。コメントを投稿するときは、投稿直前に「誹謗中傷の内容じゃないか」を確認するポップアップが出ます。
また、投稿者には購入ボタンは出現されず代わりに編集と削除ボタンが出ます。

気に入ったメニューがあれば、購入することができます。詳細ページの購入するボタンから購入ページへ遷移し、カード情報を入力して購入となります。

# 目指した課題解決
「お店の目線」と「顧客の視点」をどうやったら近づけられるかに焦点を当てました。
お客の声をダイレクトに聞けるアプリケーションは年々増えていますが、私はそこに『新作メニューを通したお客様とのコミュニケーション機能』を作成してみました。お店側は「こんなメニューを試作しているけど、世間の反応はどうだろう」と投稿し、お客様からの反応を見ることができます。
また、昨今のコロナ渦で大打撃を受けている飲食店の方々にとって別の収入源を作れないかと思い、メニュー購入機能を実装しました。ユーザーは、気に入ったメニューがあれば購入することができるのでそのお店を直接的に応援することにも繋がります。

# 洗い出した要件
トップページ
 【ボタン】
 ・新規登録/ログイン
 ・ログイン時はログアウトできるボタンがある
 ・プロフィール作成
 ・メニュー投稿

 【表示】
 ・投稿メニューの一覧
 ・ワード検索

 メニュー詳細ページ
 【ボタン】
 ・コメント送信
 ・購入
 ・編集/削除

 【表示】
 ・メニュー写真
 ・メニュー文
 ・メニュータイトル
 ・メニュー価格
 ・コメント投稿/表示機能
 ・投稿ユーザーに編集/削除機能
 ・投稿ユーザー以外には購入ボタンの表示

プロフィール作成ページ
【ボタン】
・登録

【表示】
・ユーザーの写真
・写真ない場合はダミー写真
・名前
・ひとこと

購入ページ
【ボタン】
・購入

【表示】
・カード情報入力(番号、期限、セキュリティコード)


# 実装した機能について
・登録がないとアクセスできない機能
・ログイン、ログアウト機能
・プロフィール作成機能
・メニュー投稿機能(プロフィールがないと投稿不可)
・メニュー編集、削除機能(投稿したユーザーのみ)
・コメント機能
・誹謗中傷内容確認の機能
・メニュー購入機能(投稿ユーザー以外、クレジットカードにて購入可)

# 実装予定の機能
検索機能、いいね機能


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one  :profile


## profiles テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| detail   | text   | null: false |


### Association

- belongs_to :user


## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------  | ------------------------------ |
| text     | text       | null: false                    |
| title    | string     | null: false                    |
| price    | integer    | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- belongs_to :user
- has_one    :order


## commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item


## ordersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

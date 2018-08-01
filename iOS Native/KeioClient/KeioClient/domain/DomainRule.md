# Domain Rules
## Login
- クライアント、サーバの両方で正常にCookieが発光できているか確認
- portalにアクセスしてloginにリダイレクトされたら失敗
- 今のところはCookieはオンメモリ
- リクエストを発行する度にloginにリダイレクトされないかチェック

## 画面遷移
### 初回
- LoginViewでアカウントの有効性を確認 -> Homeに
### 二回目以降
- Homeの裏でCookieを取得し、CookieRepoのパイプにプッシュ、各ViewはCookieRepoのパイプからデータが来るのを待機。
- パスワード変更時のロジックって必要?

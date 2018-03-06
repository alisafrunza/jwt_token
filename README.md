# README

`$ rails db:seed`
`$ rails db:migrate`

```
> consumer = Consumer.new
> consumer.email = "test@example.com"
> consumer.password = "12345678"
> consumer.secret = SecureRandom.urlsafe_base64(32)
> consumer.save
```

You can find more details in this [blog post](https://alisafrunza.github.io/rails/jwt-api.html).

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# c2c-nozama-api

API for Nozama site created by C2C squad.

This project uses `express` as an API and includes user authentication and common middlewares including `mongoose`.

This API follows Rails-like conventions for organizing controller and
model code, and has a routing layer which is similar to the Rails routing DSL.

## Heroku API URL

-   [`Heroku API URL`](https://protected-cliffs-21162.herokuapp.com/)

## GitHub Application Repositories

-   [`Front-End Client`](https://github.com/Coast-2-Coast/c2c-nozama-client)
-   [`Back-End API`](https://github.com/Coast-2-Coast/c2c-nozama-api/)

## Front-End Client Application URL

-   [`Client URL`](https://coast-2-coast.github.io/c2c-nozama-client)

## Project Requirements

-   [`team-project`](https://github.com/ga-wdi-boston/team-project)

## Project Dependencies

-   [`express-api-template`](https://github.com/ga-wdi-boston/express-api-template)
-   [`express-api-deployment-guide`](https://github.com/ga-wdi-boston/express-api-deployment-guide)
-   [`git-workflow-teams`](https://github.com/ga-wdi-boston/git-workflow-teams#the-ga-team-project-workflow)
-   [`stripe-express-checkout`](https://stripe.com/docs/checkout/express)
-   [`stripe.js reference`](https://stripe.com/docs/stripe.js)

-
## Dependencies

Install with `npm install`.

-   [`express`](http://expressjs.com/)
-   [`mongoose`](http://mongoosejs.com/)
-   [`stripe`](http://stripe.com/)


## Installation

Install with:
 - `git push heroku master`
 - `heroku restart`
 - `heroku open`

## Structure

This API follows the standard API project structure in Express.

`curl` command scripts are stored in [`scripts`](scripts) with names that
correspond to API actions.

User authentication is built-in.

Dependencies are stored in [`package.json`](package.json).

- [`app/controllers`](app/controllers)
- [`app/models`](app/models)
- [`config/routes.js`](config/routes.js)

### Database Structures (Schemas)

- [`orderSchema`](orderSchema)
  orderDate: Date,
  items: Array,
  total: Number,
  paid: Boolean
  rating: Number

- [`productSchema`](productSchema)
  name: String,
  price: Number,
  inventory: Number,
  image: String

- [`userSchema`](userSchema)
  email: String,
  token: String,
  passwordDigest: String

```

## API

Use this as the basis for your own API documentation. Add a new third-level
heading for your custom entities, and follow the pattern provided for the
built-in user authentication documentation.

Scripts are included in [`scripts`](scripts) to test built-in actions. Add your
own scripts to test your custom API.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:4741/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### Orders

| Verb   | URL Pattern                 | Controller#Action                      |
|--------|-----------------------------|----------------------------------------|
| POST   | `/orders`                   | `orders#create`                        |
| GET    | `/orders/`                  | `orders#indexUser`                     |
| GET    | `/userorders/:id`           | `orders#indexUser`                     |
| PATCH  | `/orders/:id`               | `orderss#update`                       |
| DELETE | `/orders/:id`               | `orders#destroy`                       |

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.

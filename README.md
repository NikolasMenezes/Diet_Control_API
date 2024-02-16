# Diet control RESTful API

## Technologies Used

<br>

- <a href="https://nodejs.org/en/"> NodeJS</a><img align="center" alt="NodeJS" height="20" width="30" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg">

- <a href="https://www.typescriptlang.org/"> TypeScript </a><img align="center" alt="TypeScript" height="20" width="30" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg">

- <a href="https://expressjs.com/">Express</a><img align="center" alt="Express" height="20" width="30" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/express/express-original.svg">

- <a href="https://www.mysql.com/">MySQL</a><img align="center" alt="MySQL" height="20" width="30" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg">
  <br>

### Endpoints:

## Users

### Get All Users

- **Endpoint:** `GET /user/all`
- **Description:** Get a list of all users.
- **Authorization:** Required (`jwtValidationMiddleware`)

### Get User by ID

- **Endpoint:** `GET /user/:id`
- **Description:** Get user details by user ID.
- **Authorization:** Required (`jwtValidationMiddleware`)

### Create User

- **Endpoint:** `POST /user`
- **Description:** Create a new user.
- **Authorization:** Not required.
- **Middleware:** `userMiddleware`

- **Body example**:

  ```json
  {
    "name": "Nikolas Menezes",
    "password": "crazy_password123",
    "email": "example@email.com",
    "isPremium": true
  }
  ```

### Update User

- **Endpoint:** `PATCH /user/:id`
- **Description:** Update user details by user ID.
- **Authorization:** Required (`jwtValidationMiddleware`)

  ```json
  {
    "name": "Nikolas Menezes",
    "password": "crazy_password123",
    "email": "example@email.com",
    "isPremium": true
  }
  ```

`obs: you can send just one of this properties to update instead of all them.`

### Delete User

- **Endpoint:** `DELETE /user/:id`
- **Description:** Delete user by user ID.
- **Authorization:** Required (`jwtValidationMiddleware`)

## User Basic Information

### Get User Basic Info

- **Endpoint:** `GET /user/info/:id`
- **Description:** Get basic information of a user by user ID.
- **Authorization:** Required (`jwtValidationMiddleware`)

### Store User Basic Info

- **Endpoint:** `POST /user/info/:id`
- **Description:** Store basic information for a user.
- **Authorization:** Required (`jwtValidationMiddleware`)
- **Middleware:** `verifyUserBasicInfoFields`

- **Body example**:

  ```json
  {
    "age": 30,
    "gender": "male",
    "height": 179,
    "weight": 85
  }
  ```

### Update User Basic Info

- **Endpoint:** `PATCH /user/info/:id`
- **Description:** Update basic information for a user.
- **Authorization:** Required (`jwtValidationMiddleware`)

- **Body example**:

  ```json
  {
    "age": 30,
    "gender": "male",
    "height": 179,
    "weight": 85
  }
  ```

`obs: you can send just one of this properties to update instead of all them.`

## Authentication

### User Login

- **Endpoint:** `POST /login`
- **Description:** Authenticate user and generate a JWT token.
- **Authorization:** Not required.

- **Body example**:

  ```json
  {
    "email": "adaWong@gmail.com",
    "password": "admin"
  }
  ```

- **Response Example**:
  ```json
  {
    "status": "success",
    "token": "your token comes here",
    "expiresIn": 1708128269245
  }
  ```

## Food Generics

### Get All Foods

- **Endpoint:** `GET /food/all`
- **Description:** Get a list of all food generics.
- **Authorization:** Required (`jwtValidationMiddleware`)

### Get Foods by Group

- **Endpoint:** `GET /food`
- **Description:** Get food generics by group.
- **Authorization:** Required (`jwtValidationMiddleware`)
- **Middleware:** `validateSentGroup`

### Get Food by ID

- **Endpoint:** `GET /food/:id`
- **Description:** Get food details by ID.
- **Authorization:** Required (`jwtValidationMiddleware`)
- **Middleware:** `validateSentGroup`

## Meals

### Get User Meals

- **Endpoint:** `GET /meal/user`
- **Description:** Get all meals for a user.
- **Authorization:** Required (`jwtValidationMiddleware`)

### Get Meal by ID

- **Endpoint:** `GET /meal/:id`
- **Description:** Get meal details by ID.
- **Authorization:** Required (`jwtValidationMiddleware`)

### Create Meal

- **Endpoint:** `POST /meal`
- **Description:** Create a new meal.
- **Authorization:** Required (`jwtValidationMiddleware`)
- **Middleware:** `verifyMealFields`

- **Body example**:

  ```json
  {
    "user_id": 1,
    "foods_id": [1, 2],
    "name": "Dinner",
    "description": "Last meal of my day"
  }
  ```

### Add Food to Meal

- **Endpoint:** `POST /meal/:id/food`
- **Description:** Add food to a meal.
- **Authorization:** Required (`jwtValidationMiddleware`)

- **Body example**:
  ```json
  {
    "food_id": [7, 8, 9]
  }
  ```

### Update Meal

- **Endpoint:** `PUT /meal/:id`
- **Description:** Update meal details.
- **Authorization:** Required (`jwtValidationMiddleware`)
- **Middleware:** `verifyMealFields`

- **Body example**:

  ```json
  {
    "name": "Lunch",
    "description": "The most important meal"
  }
  ```

### Delete Meal by ID

- **Endpoint:** `DELETE /meal/:id`
- **Description:** Delete a meal by ID.
- **Authorization:** Required (`jwtValidationMiddleware`)

### Delete Food from Meal

- **Endpoint:** `DELETE /meal/:meal_id/food/:food_id`
- **Description:** Remove a specific food from a meal.
- **Authorization:** Required (`jwtValidationMiddleware`)

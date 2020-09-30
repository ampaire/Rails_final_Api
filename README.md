# Rails_Api

This is a Rails RESTful API that allows users to create an account, update their profile so that they are able to get access to a products page where they can add items to their carts.

### Application
This API can be integrated in the following applications/ sites;
- Online shopping asites
- Home renting sites
- Car renting sites
- Labor hiring sites
- Buy and re-sell sites and very many more!

## API LINK
https://intense-savannah-62345.herokuapp.com/

## Getting Started

Clone the repository into your local computer.

```
$ git clone https://github.com/ampaire/Rails_Final_Api.git
```

### Installing

#### Pre requirements

* Ruby 2.7.1 ~>
* Rails 6.0.3 ~>

#### Start installation

Install all gems by running:

```
$ bundle install
```

Start API development server

```
$ rails s
```

### Testing

Run test command

```
$ bundle exec rspec
```


## API Documentation

 ### User SignUp
  Returns an authentication token to authorize the subsequent resquests.

* **URL** /signUp

* **Method:**
  `POST`

* ** URL Params**
  None
 
 * **Data Params**
   **Required:**
   `name=[string]` 
   `email=[string]` 
   `password=[string]` 
   `password_confirmation=[string]`
   `image=[string]`

* **Success Response:**
  * **Code:** 201
	  **Content:** `{ auth_token: JWT_GENERATED_TOKEN }`

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Image can't be blank" }`

* **Sample Call:**
  ```javascript
	axios.post("/signup", {
	    name: 'Jane Doe',
	    email: 'janed@email.com',
	    password: 'foobar',
	    password_confirmation: 'foobar',
	    image: 'https://www.example-image.com',
	  })
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

  ### Return the user's profile
  Returns a json data of the user's profile information

* **URL**
  /profile
* **Method:**
  `GET`

* **URL Params**
  None

 
 * **Data Params**
	None

* **Success Response:**
  * **Code:** 200
	  ```{
    "details": {
        "id": 3,
        "name": "sample",
        "email": "sample@email.com",
        "image": {
            "url": "http://res.cloudinary.com/effie/image/upload/v1600468505/alh10oiojrqkvjqlrtdk.jpg",
            "standard": {
                "url": "http://res.cloudinary.com/effie/image/upload/c_fill,g_north,h_150,w_100/v1600468505/alh10oiojrqkvjqlrtdk.jpg"
            },
            "thumbnail": {
                "url": "http://res.cloudinary.com/effie/image/upload/c_fit,h_50,w_50/v1600468505/alh10oiojrqkvjqlrtdk.jpg"
            }
        },
        "password_digest": "$2a$12$72ErNodQYcPmezKyzw8cguQR/f75SrgSwvI/8CAouh/A64jSD1OSa",
        "admin": true,
        "created_at": "2020-09-18T22:34:19.423Z",
        "updated_at": "2020-09-18T22:34:19.423Z",
        "mobile_number": null
    },
    "liked": [],
    "income": 0
}```

* **Error Response:**
  * **Code:** 404
    **Content:** `{ message: "Missing authorization token" }`
 
* **Sample Call:**
  ```javascript
	axios.get("/profile",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))

### User Login
  Returns an authentication token to a user that has already signed up to the application.

* **URL**
  /auth/login
* **Method:**
  `POST`

* ** URL Params**
  None
 
 * **Data Params**
   **Required:**
   `email=[string]` `password=[string]`

* **Success Response:**
  * **Code:** 200
	  **Content:** `{ auth_token: JWT_GENERATED_TOKEN }`

* **Error Response:**
  * **Code:** 401
    **Content:** `{ message: "Invalid Credentials" }`

* **Sample Call:**
  ```javascript
	axios.post("/auth/login",
	  {
	    email: goodgirl@email.com,
	    password: 123456,
	  }
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

### Update user profile
 The user is able to their profile
* **URL** /edit-profile

* **Method:**
  `PUT`

* ** URL Params**
  None
 
 * **Data Params**
   **Optional:**
   `name=[string]` 
   `email=[string]` 
   `password=[string]` 
   `password_confirmation=[string]`
   `image=[string]`

   **Requires:**
   `Authorization token`

* **Success Response:**
  * **Code:** 201
	  **Content:** `{ message: Updated details}`

* **Error Response:**
  * **Code:** 422
    **Content:** `{ message: "Missing Authorization Token" }`

* **Sample Call:**
  ```javascript
	axios.post("/edit-profile", {
	    name: 'Jane Doe',
	    email: 'johndoe@email.com',
	    password: 'foobar',
	    password_confirmation: 'foobar',
	    image: 'https://www.example-image.com',
	  })
    .then(response => console.log(response))
    .catch(error => console.log(error))
  ```

### Delete Cart
  Returns a json string with the items currently in the cart

* **URL**
  /carts/:id
* **Method:**
  `DELETE`

* ** URL Params**
   **Required:**
   `id=[integer]`
 
 * **Data Params**
	None

* **Success Response:**
  * **Code:** 204
	  **Content:** `empty`

* **Error Response:**
  * **Code:** 404
    **Content:** `{ message: "You have not added anything to your cart yet!" }`
 
* **Sample Call:**
  ```javascript
	axios.delete("/carts/:id",
	  {
	    headers: {
	      Authorization: AUTH_TOKEN,
	    },
    )
    .then(response => console.log(response))
    .catch(error => console.log(error))


## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Programming language used
* [Ruby on Rails](https://rubyonrails.org/) - Framework
* [JWT](https://jwt.io/) -Authentication

## Author

👤 **Phemia Ampaire**

[Github](https://github.com/ampaire) | [Twitter](https://twitter.com/AmpaPhem) | [LinkedIn](https://www.linkedin.com/in/phemia)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is licensed under MIT license - see [LICENSE](/LICENSE) for more details.

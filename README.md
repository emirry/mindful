# 🍎 mindfull
<p align="center">
  <img src="https://github.com/emirry/mindfull/blob/main/images/Logo.png" alt="mindfull Logo" width=400>
 </p>


Fitness is important for many people, but sometimes calorie tracking can feel like a chore. mindfull is a calorie tracking app built to encourage people to stay on track with their health goals. It's simple and user-friendly. Great for anyone who wants to maintain or lose weight!

>Tech Stack: Swift and Django
>Deployment: Heroku (for back-end)

## 🍎 Contents

1. [Planning Process](#-planning-process)
2. [Features](#-features)
3. [Installation](#-installation)
4. [Dependencies](#-dependencies)
5. [Resources](#-resources)
6. [Design](#-design)
7. [Screenshots](#-screenshots)

## 🍎 Planning Process
[Google Diagrams](https://app.diagrams.net/) was used as part of the planning. Along with documenting the whole process of this project, creating these diagrams helped me to understand the relationships and the steps that were neccessary to build mindfull. 


<p>
  <img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%207.06.21%20PM.png" alt="Planning Diagram" width=400>
</p>
<p>
  <img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%207.06.21%20PM.png" alt="Planning Diagram" width=400>
</p>

## 🍎 Features
### MVP
##### As a user...
- I want to create a new account so that I can start my fitness journey
- I want to share some personal information such as my current weight, height, and activity level so that I can receive a recommended caloric intake
- I want to search for food items I've eaten so that I can log it into my journal
- I want to see the nutrition facts for what I've eaten so that I can monitor my daily intake

## 🍎 Installation
### Here is a list of installations that were necessary to build this app:

- [Swift/XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
- [Django](https://www.djangoproject.com/download/)
- [Python](https://docs.brew.sh/Homebrew-and-Python)
- [PostgreSQL](https://formulae.brew.sh/formula/postgresql)
- [pgAdmin4](https://www.pgadmin.org/download/)
- [Heroku](https://devcenter.heroku.com/articles/heroku-cli)
- [VS Code](https://code.visualstudio.com/download)

### External Api

-[Edamam](https://developer.edamam.com/)

## 🍎 Dependencies
### Swift

- [Google sign in](https://developers.google.com/identity/sign-in/ios)
- [Cocoapods](https://cocoapods.org/)
- [Cocoapods Keys](https://github.com/orta/cocoapods-keys)

### Python/Django

- [Django Rest Framework](https://www.django-rest-framework.org/#installation)
- [psycopg2](https://pypi.org/project/psycopg2/)
- [Venv](https://docs.python.org/3/library/venv.html)

### Heroku

>Note:
>I had to create a separate repo for my [back-end](https://github.com/emirry/mindfull-backend/tree/master). I learned that Heroku needs to see requirements.txt/Pipfile/setup.py in the root file.

- [Gunicorn](https://devcenter.heroku.com/articles/python-gunicorn)
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- [dj-database-url](https://pypi.org/project/dj-database-url/)

## 🍎 Resources
### I could not have done this project without these documentations and tutorials! Highly recommend if you want to build an iOS app!

- [Swift](https://swift.org/)
- [Django](https://docs.djangoproject.com/en/3.1/)
- [Python](https://docs.python.org/3/)
- [John Gallaugher](https://www.youtube.com/user/profgallaugher)
- [CodeWithChris](https://www.youtube.com/user/CodeWithChris)
- [Lets Build That App](https://www.youtube.com/channel/UCuP2vJ6kRutQBfRmdcI92mA)

## 🍎 Design
- [mindfull trello link](https://trello.com/b/D9sopo2g/ada-capstone)
- [mindfull prototype figma link](https://www.figma.com/file/FbbCYgI5i6OamxKbUkkZjE/mindfull?node-id=0%3A1)

## 🍎 Screenshots
| [!(<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%201.44.57%20PM.png" alt="Login Screen" width=150>)] |
[!<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.41.50%20PM.png" alt="Google Signin" width=150>] |
[!<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.42.07%20PM.png" alt="Welcome" width=150>] |
[!<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.42.19%20PM.png" alt="Form" width=150>] |
[!<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.42.53%20PM.png" alt="Caloric Intake" width=150>
[!<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.43.06%20PM.png" alt="Journal" width=150>
<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.43.22%20PM.png" alt="Food Entries" width=150>
<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.43.37%20PM.png" alt="Food Search" width=150>
<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.43.56%20PM.png" alt="Food Entry" width=150>
<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.44.05%20PM.png" alt="Nutrition Facts" width=150>
<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.44.18%20PM.png" alt="Delete" width=150>
<img src="https://github.com/emirry/mindfull/blob/main/images/Screen%20Shot%202021-02-17%20at%206.44.39%20PM.png" alt="Nutriton Ring" width=150>

>Note: The nutrition ring in the image above is not complete. Just the start 🙂



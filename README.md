# README

開発環境
- ruby 2.6.5
- rails 5.2.3
- PostgreSQL 11.5


Model:Task

|  Column    |    Type    |
| ---------- | ---------- |
|  id        |  integer   |
|  name      |  string    |
| content    |  text      |
| deadline   |  datetime  |
| status     |  integer   |
| priority   |  integer   |
|  user_id   |  references|


Model:User

|   Column         |       Type     |
| -----------      | ------------   |
|  id              |   integer      |
|  name            |   string       |
|  email           |   string       |
|  password_digest |   string       |
|  admin           |   boolean      |

Model:Label

|   Column         |       Type     |
| -----------      | ------------   |
|  id              |   integer      |
|  name            |   string       |

Model:Labeling

|   Column         |       Type     |
| -----------      | ------------   |
|  id              |   integer      |
|  task_id         |   references   |
|  label_id        |   references   |


## Description

deploy to github
* $ git add .
+ $ git commit -m 'message'
- $ git push origin master


deploy to heroku

* $ heroku create
+ $ heroku push origin master
- $ heroku run rails db:migrate

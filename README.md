# README


|   Task     |           |
| ---------  | --------  |
|  id        |  integer  |
|  name      |  string   |
| content    |  text     |
| expiaration|  date     |
|  priority  |  integer  |
|  type      |  string   |
|  user_id   |  text     |

|   User           |                |
| -----------      | ----------     |
|  id              |  integer       |
|  name            |  string        |
|  email           |  string        |
|  password_digest |  string        |


|   Status     |             |
| ---------    | --------    |
|  id          |  integer    |
|  waiting     |  string     |
|  working     |  string     |
|  completed   |  string     |
|  task_id     |  integer    |


## Description
deploy to github
1.git add .
2.git commit -m 'message'
3.git push origin master

deploy to heroku
1.heroku create
2.heroku push origin master
3.heroku run rails db:migrate

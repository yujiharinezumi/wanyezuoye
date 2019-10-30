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
* git add
+ git commit -m 'message'
- git push origin master


deploy to heroku
* heroku create
+ heroku push origin master
- heroku run rails db:migrate

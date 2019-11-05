# README


|   Task     |           |
| ---------  | --------  |
|  id        |  integer  |
|  name      |  string   |
| content    |  text     |
| deadline   |  datetime |
| status     |  integer  |
| priority   |  integer  |

|  user_id   |  text     |

|   User           |                |
| -----------      | ----------     |
|  id              |  integer       |
|  name            |  string        |
|  email           |  string        |
|  password_digest |  string        |




## Description
deploy to github
* git add
+ git commit -m 'message'
- git push origin master


deploy to heroku
* heroku create
+ heroku push origin master
- heroku run rails db:migrate

[![Actions Status](https://github.com/zhabinka/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/zhabinka/rails-project-lvl1/actions)

# HexletCode

Gem allows you to automatically generate a form in web application.

## Installation

`make install`  
`make lint` 

## Usage

```ruby
require 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'ck', job: 'hexlet', gender: 'male'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="ck">hexlet</textarea>
# </form>
```

# 🐬 sweet like bubblegum

hi this is my new git repo for my blog bubblegum. i wrote this based on the rails first app guide and then i added stuff. it's a fucking mess i know

### site to-do list
* make the index design less shit
* make the post page less shit (i don't really care that much about this one but at least resize the text boxes that's annoying)

### completed to-do stuff
* make tags actually functional because i started adding them in prod like a fucking dumbass, got stuck, and never finished it because i was stuck and frustrated

### mini rails console command cheatsheet for me:

new tags:

```ruby
t = Tag.new(:name => 'tutorial')

t.save!

t = Tag.find_by(name: "tutorial")
```

add tag to article:

```ruby
t = Tag.find_by(name: "tutorial")

t.articles << Article.find_by(id:"1")
```

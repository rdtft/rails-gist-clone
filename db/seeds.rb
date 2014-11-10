# encoding: UTF-8
require 'pp'

def construct_path(path)
  Rails.root.join(path).to_s
end

def file_contents(path)
  full_path = construct_path(path)
  File.readlines(full_path).join
end

User.delete_all
Gist.delete_all

u1 = User.create(email: 'rdtft@me.com', password: 'foobarbaz')
u2 = User.create(email: 'joe@erlang.com', password: 'spawn-foobar')
u3 = User.create(email: 'william@lost.com', password: '24-foobarbaz')

g1 = Gist.create(user_id: u1.id, description: 'seeds.rb',   content: file_contents('db/seeds.rb'))
g2 = Gist.create(user_id: u1.id, description: '',  		 content: file_contents('config/application.rb'), private: true)
g3 = Gist.create(user_id: u1.id, description: 'Gemfile',  content: file_contents('Gemfile'))
g4 = Gist.create(user_id: u2.id, description: 'Rakefile', content: file_contents('Rakefile'))
g5 = Gist.create(user_id: u3.id, description: 'user model', content: file_contents('app/models/user.rb'))

Comment.create(user_id: u1.id, gist_id: g1.id , body: "Thanks!\nHave a nice day")
Comment.create(user_id: u2.id, gist_id: g1.id , body: 'Thanks!')
Comment.create(user_id: u3.id, gist_id: g1.id , body: 'まだ未完成')

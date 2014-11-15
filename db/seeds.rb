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
u2 = User.create(email: 'mononcqc@ferd.ca', password: 'spawn-foobar')
u3 = User.create(email: 'aaron.patterson@gmail.com', password: '24-foobarbaz')

g1 = Gist.create(user_id: u1.id, description: 'seeds.rb', content: file_contents('db/seeds.rb'))
g2 = Gist.create(user_id: u1.id, description: '', content: file_contents('config/application.rb'), private: true)
g3 = Gist.create(user_id: u1.id, description: 'Gemfile', content: file_contents('Gemfile'))
g4 = Gist.create(user_id: u2.id, description: 'My favorite Erlang program',content: "
universal_server() ->
    receive
       {become, F} ->
           F()
    end.


factorial_server() ->
    receive
       {From, N} ->
           From ! factorial(N),
           factorial_server()
    end.

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).

test() ->
    Pid = spawn(fun universal_server/0),
    Pid ! {become, fun factorial_server/0},
    Pid ! {self(), 50},
    receive
        X -> X
    end	
")
g5 = Gist.create(user_id: u3.id, description: 'モデル', content: file_contents('app/models/user.rb'))

Comment.create(user_id: u3.id, gist_id: g5.id , body: "hey\nThe code is basically exactly what we'd have to do")
Comment.create(user_id: u2.id, gist_id: g1.id , body: 'Thanks!')
Comment.create(user_id: u3.id, gist_id: g1.id , body: 'ここで何が起こっている\n')
Comment.create(user_id: u2.id, gist_id: g4.id , body: "That was pretty easy.\nOnce I have created a universal serve it just sits and waits for a {become, F} message and then it becomes an F server.")

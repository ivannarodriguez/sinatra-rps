require "sinatra"
require "sinatra/reloader"

actions = ["rock", "paper", "scissors"]

def rock_paper_scissors(ours, theirs) # i'd written ifelse statements, learned about case thru chatgpt
  result = case [ours, theirs]
           when ["rock", "scissors"], ["paper", "rock"], ["scissors", "paper"]
             "We won!"
           when ["rock", "paper"], ["paper", "scissors"], ["scissors", "rock"]
             "We lost!"
           else
             "We tied!"
           end

  return result
end

get("/") do
  erb(:homepage)
end

get("/rock") do
  @ours = "rock"
  @theirs = actions.sample
  @result = rock_paper_scissors(@ours, @theirs)

  erb(:rock)
end

get("/paper") do
  @ours = "paper"
  @theirs = actions.sample
  @result = rock_paper_scissors(@ours, @theirs)

  erb(:paper)
end

get("/scissors") do
  @ours = "scissors"
  @theirs = actions.sample
  @result = rock_paper_scissors(@ours, @theirs)
  erb(:scissors)
end

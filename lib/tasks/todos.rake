namespace :todos do
  desc "Delete all todos older than two minutes"
  task delete: :environment do
    Todo.where("created_at <= ?", Time.now - 2.minutes).destroy_all
  end

  desc "Add amusing sample todos to todo list"
  task seed: :environment do
    sample_todos = ["Work for a respectable software company",
                    "Pay your taxes",
                    "Help the landlady take out her garbage",
                    "Save the world" ]
    sample_todos.length.times do |num|
      user = User.find_by_name("Mr. Anderson")
      user.todos.build(description: sample_todos[num]).save
    end
  end
end


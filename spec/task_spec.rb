require('rspec')
require('pg')
require('task')



DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do
  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL"})
      task2 = Task.new({:description => "learn SQL"})
      expect(task1).to eq(task2)
    end
  end
end

describe('#all') do
  it("is empty at first") do
    expect(Task.all()).to eq([])
  end
end

describe('#save') do
  it("adds a task to the array of saved tasks") do
    test_task = Task.new({:description => "learn SQL"})
    test_task.save()
    expect(Task.all()).to eq([test_task])
  end
end

  # describe('#description') do
  #   it("lets you give a description") do
  #     test_task = Task.new("scrub the zebra")
  #     expect(test_task.description()).to eq("scrub the zebra")
  #   end
  # end
  #

  #

  #
  # describe('#clear') do
  #   it("empties out all of the saved tasks.") do
  #     Task.new("wash the lion").save()
  #     Task.clear()
  #     expect(Task.all()).to eq([])
  #   end
  # end
# end

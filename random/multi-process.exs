# Prep the agent.
Agent.start_link(fn -> 0 end, name: :adding_machine)
# SPIN UP PROCESSES!!!!
tasks = Enum.map(1..10_000, fn x ->
  Task.async(fn ->
    :timer.sleep(200)
    Agent.update(:adding_machine, fn counter -> counter + x end)
  end)
end)
# Wait for everything to complete!
for task <- tasks, do: Task.await(task)
# Print the result.
count = Agent.get(:adding_machine, fn counter -> counter end)
Agent.stop(:adding_machine)
IO.puts "Total amount: #{count}"

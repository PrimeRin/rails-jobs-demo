class ExampleJob
  include Sidekiq::Job
  # sidekiq_options queue: 'custom_queue'

  def perform(*args)
    # Simulate a long-running task
    puts "Executing Sidekiq Job with args: #{args.inspect}"

    # Sleep for 10 seconds to mock job processing time
    sleep(100)

    # After the sleep, job continues
    puts "Job completed after sleeping for 10 seconds."
  end
end

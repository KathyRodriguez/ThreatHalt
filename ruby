require 'date'
require 'csv'

def extract_log_data(log_file)
    """
    Extract data from a log file.
    """
    data = []
    File.open(log_file, 'r') do |file|
        file.each_line do |line|
            # Extract relevant data using regular expressions
            match = /(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}).*Some important event/.match(line)
            if match
                timestamp = DateTime.parse(match[1])
                data << timestamp
            end
        end
    end
    return data
end

def analyze_log_data(data)
    """
    Analyze extracted log data.
    """
    # Do some analysis on the data
    num_events = data.length
    first_event_time = data.first
    last_event_time = data.last

    # Print out the results
    puts "Number of events: #{num_events}"
    puts "First event time: #{first_event_time}"
    puts "Last event time: #{last_event_time}"
end

if __FILE__ == $0
    log_file = gets.chomp
    data = extract_log_data(log_file)
    analyze_log_data(data)
end

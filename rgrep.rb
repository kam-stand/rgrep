#-w
##### Function to process word only in the file
def word_file(file_path, pattern)
  file = File.open(file_path, 'r')
  lines = file.readlines
  lines.each do |line|
    words = line.split
    words.each do |word|
      # If word is found return the line not the actual word
      if word =~ /^#{pattern}$/
        puts line
      end
    end
  end
end
# -w -c
##### Function to count the words in file 
def word_file_count(file_path, pattern)
  counter = 0
  file = File.open(file_path, 'r')
  lines = file.readlines
  lines.each do |line|
    words = line.split
    words.each do |word|
      if word =~ /^#{pattern}$/
        counter +=1
      end
    end
  end
  return puts counter
end

#-w -m
# Find the word in the file and return the word at the given line 
def word_file_match(file_path, pattern)
  file = File.open(file_path, 'r')
  lines = file.readlines
  lines.each do |line|
    words = line.split
    words.each do |word|
      # Found word and return to stdout
      if word =~ /^#{pattern}$/
        puts word
      end
    end
  end
end

# -p -m
# Function to find the matched pattern in the line
def pattern_file_match(file_path, pattern)
  File.open(file_path, 'r') do |file|
    file.each_line do |line|
      matches = line.scan(/#{pattern}/)
      matches.each { |match| puts match } if matches.any?
    end
  end
end

# -p
# Function to find the line that containes the pattern
def pattern_file(file_path, pattern)
  File.open(file_path, 'r') do |file|
    file.each_line do |line|
      if line =~ /#{pattern}/
        puts line
      end
    end
  end
end

# -p -c
# Return the count for lines that contain pattern
def pattern_file_count(file_path, pattern)
  counter = 0
  File.open(file_path, 'r') do |file|
    file.each_line do |line|
      if line =~ /#{pattern}/
        counter +=1
      end
    end
  end
  return puts counter
end

# -v
### Opposite of -p
def not_pattern(file_path, pattern)
  File.open(file_path, 'r') do |file|
    file.each_line do |line|
      if line !~ /#{pattern}/
        puts line
      end
    end
  end
end


# -v -c
### Opposite of -p with count variable
def not_pattern_counter(file_path, pattern)
  counter = 0
  File.open(file_path, 'r') do |file|
    file.each_line do |line|
      if line !~ /#{pattern}/
        counter +=1
      end
    end
  end
  return puts counter
end


# Function to parse the given options from the commandline returns dictionary
def parseoptions(options)
    hash = {'-w': false, '-p': false, '-v': false, '-c': false, '-m': false}
    options.each do |options|
      case options
      when '-w'
        hash['-w'] = true
      when '-p'
        hash['-p'] = true
      when '-v'
        hash['-v'] = true
      when '-c'
        hash['-c'] = true
      when '-m'
        hash['-m'] = true
      end
    end
    return hash
end

# Given a valid file path exectues the options with given pattern
def executeoptions(options, file_path, pattern)
  # Default to -p if no options are provided
  if options.values.all? { |v| v == false }
    options['-p'] = true
  end

  # Check for invalid combinations
  if invalid_combination?(options)
    puts "Invalid combination of options"
    return
  end

  case
  when options['-c']
    execute_count_option(options, file_path, pattern)
  when options['-m']
    execute_match_option(options, file_path, pattern)
  when options['-p']
    pattern_file(file_path, pattern)
  when options['-w']
    word_file(file_path, pattern)
  when options['-v']
    not_pattern(file_path, pattern)
  else
    puts "Invalid combination of options"
  end
end

# Function to check invalid combination
def invalid_combination?(options)
  (options['-m'] && options['-c']) ||
  (options['-v'] && (options['-w'] || options['-p'] || options['-m']))
end


# Function that extends execution but only with count variables
def execute_count_option(options, file_path, pattern)
  if options['-w']
    word_file_count(file_path, pattern)
  elsif options['-p']
    pattern_file_count(file_path, pattern)
  elsif options['-v']
    not_pattern_counter(file_path, pattern)
  else
    "Invalid combination of options"
  end
end
# Function that extends execution but only match vairable 
def execute_match_option(options, file_path, pattern)
  if options['-w']
    word_file_match(file_path, pattern)
  elsif options['-p']
    pattern_file_match(file_path, pattern)
  else
    "Invalid combination of options"
  end
end


# Function for invalid option given by TA
def invalid_options?(args)
  args.any? { |arg| arg =~ /^-[^wpvcm]$/ }
end


# Driver function that will parse ARGV

def parseArguments(arguments)
  if arguments.empty?
    puts "Missing required arguments"
  elsif invalid_options?(arguments[1..-1])
    puts "Invalid option"
  elsif arguments.length < 2
    puts "Missing required arguments"
  else
    file_path = arguments[0]
    # check if the file exists if not
    unless File.exist?(file_path)
      puts "File not found: #{file_path}"
      return
    end
    pattern = arguments[-1]
    options = arguments[1...-1]

    parsed_options = parseoptions(options)
    
    if invalid_combination?(parsed_options)
      puts "Invalid combination of options"
    else
      if options.empty?
        pattern_file(file_path, pattern)
      else
        executeoptions(parsed_options, file_path, pattern)
      end
    end
  end
end


# MAIN
parseArguments(ARGV)

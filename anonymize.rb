invoke_path = Dir.pwd
timestamp = Time.now.strftime('%F')

review_folder = File.join(invoke_path, "review_#{timestamp}")
`mkdir #{review_folder}`

Dir.chdir(ARGV[0])

key_file = File.join(invoke_path, "review_key_#{timestamp}.txt")
File.open(key_file, 'w') do |f|
  foreign_branches = `git branch --list -r`
  foreign_branches.split("\n").map(&:strip).each_with_index do |branch, index|
    next if branch =~ /master$/
    puts "Fetching branch #{index}"
    f.puts "#{index}: #{branch}"

    branch_folder = File.join(review_folder, index.to_s)
    `mkdir #{branch_folder}`

    `git checkout #{branch} 2>&1`
    `cp -r * #{branch_folder}`
  end
end

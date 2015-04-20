invoke_path = Dir.pwd

Dir.chdir(ARGV[0])

foreign_branches = `git branch --list -r`

foreign_branches.split("\n").each_with_index do |branch, index|
  p branch.strip
  puts `git checkout #{branch}`
end
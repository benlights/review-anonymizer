invoke_path = Dir.pwd

review_folder = File.join(invoke_path, "review_#{Time.now.strftime('%F')}")

`mkdir review_folder`

Dir.chdir(ARGV[0])

foreign_branches = `git branch --list -r`

foreign_branches.split("\n").each_with_index do |branch, index|
  branch_folder = File.join(review_folder, index.to_s)
  `mkdir branch_folder`
  p branch.strip
  # `git checkout #{branch}`
end
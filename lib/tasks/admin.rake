namespace :admin do
  desc "List admins"
  task :list => :environment do
    User.with_role(:admin).each do |u|
      puts u.email
    end
  end
  desc "Add an admin (specify email address)"
  task :add, [:email] => :environment do |t, args|
    u = User.find_by_email(args.email)
    if u
      u.add_role :admin
      puts "#{u.email} is now an admin"
    else
      puts "No such user #{args.email}"
    end
  end
  desc "Remove an admin (specify email address)"
  task :remove, [:email] => :environment do |t, args|
    u = User.find_by_email(args.email)
    if u
      u.remove_role :admin
      puts "#{u.email} is no longer an admin"
    else
      puts "No such user #{args.email}"
    end
  end
end


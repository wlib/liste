#!/usr/bin/env ruby
# Liste - reminders, notes, ideas on the go
# Daniel Ethridge

require 'fileutils'

args = ARGV.map(&:downcase)

# Creates a new list
def init(list)
  unless File.directory?("#{Dir.home}/.liste")
    FileUtils.mkdir_p("#{Dir.home}/.liste")
  end
  File.open("#{Dir.home}/.liste/#{list}.list", "w")
  puts "New list created in '#{Dir.home}/.liste/#{list}.list'\n"
end

# Pretty-prints a list's contents
def disp(listname, style)
  list = File.open("#{Dir.home}/.liste/#{listname}.list", "r") rescue init(listname)
  case style
    when "bullet"
      bullet = "\u2022"
      File.foreach(list) do |line|
        puts " #{bullet} #{line}"
      end
    when "check"
      check = "\u2714"
      File.foreach(list) do |line|
        puts " #{check} #{line}"
      end
    when "number"
      File.foreach(list).with_index do |line, i|
        puts "#{i+1}. #{line}"
      end
  end
  print "\n"
end

# Shortcut the manually edit a list
def edit_list(list = "todo")
  system "editor #{Dir.home}/.liste/#{list}.list" rescue edit_list()
end

# Simple interactive list remover
def rmi()
  puts "Type which of these lists to remove, type `exit` when done\n\n"
  dir = Dir["#{Dir.home}/.liste/*.list"].join("\n") rescue exit
  puts dir.scan(/(?<=\.liste\/)(.*?)(?=\.list)/)
  print "\nremove> "
  input = $stdin.gets.chomp
  if input == "exit"; exit; end
  FileUtils.rm_r("#{Dir.home}/.liste/#{input}.list") rescue rmi()
  puts "List '#{input}' removed"
end

# Removes an array of lists
def rm_lists(lists)
  i = 0
  while i < lists.length
    FileUtils.rm_r("#{Dir.home}/.liste/#{lists[i]}.list") rescue rmi()
    i += 1
  end
  puts "List(s) '#{lists.join(', ')}' removed"
end

# Just running `liste` (no arguments) will display content of the "todo" list
if ARGV.empty?
  puts "Things to do...\n\n"
  disp("todo", "number") rescue
    puts "...nothing here yet"; exit
  exit
end

# Defines how the arguments are interpretted
case args[0]
  when "?", "h", "help", "-h", "--help"
    puts "\nUsage : `liste` or `liste [arguments]`\n\n\
    Liste is for those who have short-term memory and\n\
    those who need constant reminders.\n\
    You should add the line 'liste login' to your .bashrc\n\n\
    do task            :  add 'task' to the todo list\n\
    add list task      :  add 'task' to 'list'\n\
    disp list          :  display content of 'list'\n\
    login              :  show your login list\n\
    mark list done 1   :  remove line 1 from list\n\
    edit list          :  open list in editor\n\
    rmi                :  interactively remove lists\n\
    rm list1 list2 etc :  remove lists list1, list2, etc\n\n\
    If you find a bug, want extra features, or have a suggestion, make a branch\n\
    on github : https://github.com/wlib/liste\n\n"
  # `liste do "my task"` adds "my task" to the "todo" list
  when "do"
    todo = File.open("#{Dir.home}/.liste/todo.list", "a") rescue
      init("todo"); todo = File.open("#{Dir.home}/.liste/todo.list", "a")
    todo << "#{ARGV[1..-1].join(' ')}\n"
    exit
  # `liste add login "my reminder"` adds a line to the list "login"
  when "add"
    list = File.open("#{Dir.home}/.liste/#{ARGV[1]}.list", "a") rescue
      init("#{ARGV[1]}"); list = File.open("#{Dir.home}/.liste/#{ARGV[1]}.list", "a")
    list << "#{ARGV[2..-1].join(' ')}\n"
    exit
  # Displays the content in any list
  when "disp"
    puts "Your list '#{ARGV[1]}'...\n\n"
    disp("#{ARGV[1]}", "bullet") rescue
      puts "...nothing here yet"; exit
    exit
  # This displays the "login" list
  when "login"
    puts "Your tasks...\n\n"
    disp("login", "bullet") rescue
      puts "...nothing here yet"; exit
    exit
  # Marks a list or line in a list a certain way...
  when "mark"
    case args[2]
      # Marks a line as done, removes from that list, adds to the "done" list
      when "done"
        listfile = File.open("#{Dir.home}/.liste/#{args[1]}.list", "r+") rescue exit
        todo = listfile.readlines
        listfile.close
        done = File.open("#{Dir.home}/.liste/done.list", "a") rescue
          done_init(); done = File.open("#{Dir.home}/.liste/done.list", "a")
        line_index = args[3].to_i - 1
        if line_index >= todo.length; puts "check line number"; exit end
        done.puts todo[line_index]
        todo.delete_at(line_index)
        listfile = File.open("#{Dir.home}/.liste/#{args[1]}.list", "w")
        listfile.puts todo
        exit
      else
        puts "not sure what to mark... did you mean `liste mark [list] done [line #]`"
    end
  # Calls the edit shortcut
  when "edit"
    edit_list(ARGV[1])
    exit
  # Calls interactive list deletion
  when "rmi"
    rmi()
  # Calls deletion of one or more lists
  when "rm"
    if args.length < 2; puts "did you mean `liste rmi` for interactive list removal?"; exit end
    rm_lists(ARGV[1..-1])
    exit
  else
    puts "Your first argument was not valid"
end
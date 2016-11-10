#!/usr/bin/env ruby
# Functions used in liste
# Daniel Ethridge
# { :list1 => {:i1 => "item1", :i2 => "item2"} }, { :list2 => {:i1 => "item1", :i2 => "item2"} }

module Liste
  # Creates a new list
  def init()
    unless File.directory?("#{Dir.home}/.liste")
      require 'fileutils'
      FileUtils.mkdir_p("#{Dir.home}/.liste")
    end
    File.open("#{Dir.home}/.liste/main.list", "w")
    puts "New list created in '#{Dir.home}/.liste/main.list'\n\n"
  end

  # Make a list item and add to the json list file
  def add(listname, content, path="#{Dir.home}/.liste/main.list")
    require 'json'
    file = File.open("#{path}", 'r+')
    listfile = file.read
    file.close
    file = File.open("#{path}", 'w')
    listhash = JSON.parse(listfile)
    listcontent = listhash[listname]
    i = 0
    while listcontent.keys.include? "l#{i}"
      i += 1
    end
    newcontent = { "l#{i}" => content }
    listcontent.merge!(newcontent)
    newjson = JSON.pretty_generate(listhash)
    file.puts newjson
    file.close
  end

  # Pretty-prints a list's contents
  def disp(listname, style)
    require 'json'
    file = File.open("#{Dir.home}/.liste/main.list") rescue init()
    listfile = file.read
    listhash = JSON.parse(listfile)
    bullet = "\u2022"
    check = "\u2714"
    i = 0
    while i < listhash[listname].count
      puts listhash[listname]["l#{i}"]
      i += 1
    end
    print "\n"
  end

  # Shortcut the manually edit a list
  def edit_list()
    system "editor #{Dir.home}/.liste/main.list" rescue edit_list()
  end
end
#!/usr/bin/env ruby
# Functions used in liste
# Daniel Ethridge

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

  def newlistfile(listname, content, path)
  	hash = { :"#{listname}" => {:l0 => content} }
    json = JSON.pretty_generate(hash)
    file = File.open("#{path}", 'w')
    file.puts json
    file.close
    puts "new list '#{listname}' created"
  end

  def newlist(listname, content="This is a placeholder", path="#{Dir.home}/.liste/main.list")
    require 'json'
    file = File.open("#{path}", 'r')
    listfile = file.read
    file.close
    if listfile.nil? || listfile.empty?; newlistfile(listname, content, path); exit end
    listhash = { :"#{listname}" => {:l0 => content } }
    hash = JSON.parse(listfile)
    newhash = hash.merge!(listhash)
    json = JSON.pretty_generate(newhash)
    file = File.open("#{path}", 'w')
    file.puts json
    file.close
  end

  # Make a list item and add to the json list file
  def add(listname, content, path="#{Dir.home}/.liste/main.list")
    require 'json'
    file = File.open("#{path}", 'r')
    listfile = file.read
    file.close
    listhash = JSON.parse(listfile)
    if ! listhash.keys.include? listname; newlist(listname) end
    listcontent = listhash[listname]
    i = 0
    while listcontent.keys.include? "l#{i}"
      i += 1
    end
    newcontent = { "l#{i}" => content }
    listcontent.merge!(newcontent)
    newjson = JSON.pretty_generate(listhash)
    file = File.open("#{path}", 'w')
    file.puts newjson
    file.close
  end

  def putlines(listname)
    require 'json'
    file = File.open("#{Dir.home}/.liste/main.list") rescue init()
    listfile = file.read
    listhash = JSON.parse(listfile)
    linesout = []
    i = 0
    while i < listhash[listname].count
      line = listhash[listname]["l#{i}"]
      linesout << "#{line}"
      i += 1
    end
    linesout
  end

  # Pretty-prints a list's contents
  def disp(listname, style)
    bullet = "\u2022"
    check = "\u2714"
    linesout = putlines(listname)
    case style
      when "bullet"
      linesout.each do |line|
        puts " #{bullet} #{line}"
      end
      when "check"
        linesout.each do |line|
          puts " #{check} #{line}"
        end
      when "number"
        linesout.each.with_index do |line, i|
          puts "#{i+1}. #{line}"
        end
    end
    print "\n"
  end

  # Shortcut the manually edit a list
  def edit_list()
    system "editor #{Dir.home}/.liste/main.list" rescue edit_list()
  end
end
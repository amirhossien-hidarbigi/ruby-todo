# todo.rb
TODO_FILE = "todos.txt"
File.write(TODO_FILE, "") unless File.exist?(TODO_FILE)

def show_menu
  puts "\n📝 Todo List Menu:"
  puts "1. نمایش تسک‌ها"
  puts "2. افزودن تسک جدید"
  puts "3. حذف تسک"
  puts "4. خروج"
  print "انتخاب شما: "
end

def list_todos
  todos = File.readlines(TODO_FILE, chomp: true)
  if todos.empty?
    puts "\n📭 هنوز هیچ تسکی نداری!"
  else
    puts "\n📋 لیست تسک‌ها:"
    todos.each_with_index do |todo, i|
      puts "#{i + 1}. #{todo}"
    end
  end
end

def add_todo
  print "\nبنویس چی می‌خوای انجام بدی: "
  task = gets.chomp
  File.open(TODO_FILE, "a") { |f| f.puts(task) }
  puts "✅ تسک '#{task}' اضافه شد!"
end

def remove_todo
  todos = File.readlines(TODO_FILE, chomp: true)
  list_todos
  print "\nشماره‌ی تسک برای حذف: "
  index = gets.to_i - 1
  if index >= 0 && index < todos.size
    removed = todos.delete_at(index)
    File.write(TODO_FILE, todos.join("\n"))
    puts "🗑 تسک '#{removed}' حذف شد."
  else
    puts "⚠️ شماره‌ی نامعتبر!"
  end
end

loop do
  show_menu
  choice = gets.to_i
  case choice
  when 1 then list_todos
  when 2 then add_todo
  when 3 then remove_todo
  when 4
    puts "👋 خداحافظ!"
    break
  else
    puts "❌ گزینه‌ی نامعتبر!"
  end
end

class Seed
  def initialize
    create_languages
    create_users(50)
    add_languages_to_users
  end

  def create_languages
    languages = [ "JavaScript",       
                  "Java",
                  "Ruby",
                  "C",
                  "CSS",
                  "PHP",
                  "Python",
                  "C++",
                  "Objective-C",
                  "C#",
                  "Shell",
                  "R",
                  "CoffeeScript",
                  "Go",
                  "Perl",
                  "Scala",
                  "VimL",
                  "Clojure",
                  "Haskell",
                  "Erlang",
                  "Rust",
                  "Swift"]
    languages.each do |lang|
      language = Language.create(name: lang)
      puts "created language #{language.name}"
    end
  end

  def create_users(amount)
    amount.times do 
      user = User.create(name: Faker::Name.name,
                         description: Faker::Hacker.say_something_smart,
                         image: Faker::Avatar.image)
      puts "created #{user.name}"
    end
  end

  def add_languages_to_users
    num = Random.rand(10)
    User.all.each do |user|
      user.languages << Language.all.sample(num)
      puts "#{user.name} likes #{num} languages"
    end
  end
end

Seed.new

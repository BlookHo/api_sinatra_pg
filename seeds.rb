Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run


    dataset = DB[:companies]
    puts 'in companies seeeds.rb'
      # dataset.insert(:id => 1, :name => 'MoGo', :location => 'New York')
      # dataset.insert(:id => 2,:name => 'Wirkkle', :location => 'London')
      # dataset.insert(:id => 3,:name => 'Artesis', :location => 'Saint-Petersburg')
      # dataset.insert(:id => 4,:name => 'NewAge-seed file', :location => 'Toronto')
      # dataset.insert(:name => 'MoGo', :location => 'New York')
      # dataset.insert(:name => 'Wirkkle', :location => 'London')
      # dataset.insert(:name => 'Artesis', :location => 'Saint-Petersburg')
      # dataset.insert(:name => 'NewAge-seed file', :location => 'Toronto')
    dataset.insert(:name => 'Old Style seeds file', :location => 'Ontario')

    dataset = DB[:geeks]
    puts 'in geeks seeeds.rb'
      # dataset.insert(:name => 'Anna Ivanova', :stack => 'RubyOnRails, JS', :resume => true)
      # dataset.insert(:name => 'Nick Petrov', :stack => 'Node, JS', :resume => false)
      # dataset.insert(:name => 'Michail Smirnov', :stack => 'Php, HTML', :resume => true)
      # dataset.insert(:name => 'Petr Antonov', :stack => 'Ruby, front-end', :resume => true)
      # dataset.insert(:name => 'Nina Alekseeva', :stack => 'full stack web', :resume => true)
      # dataset.insert(:name => 'Egor Nikolaev', :stack => 'C++, .NET', :resume => false)
      # dataset.insert(:name => 'Fyodor Pletnev', :stack => 'Java', :resume => true)
    dataset.insert(:name => 'Ilya Ilyin', :stack => 'Ruby, R', :resume => false)

  end
end


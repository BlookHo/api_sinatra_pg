Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run
    dataset = DB[:companies]

    dataset.insert(:name => 'MoGo', :location => 'New York')
    dataset.insert(:name => 'Wirkkle', :location => 'London')
    dataset.insert(:name => 'Artesis', :location => 'Saint-Petersburg')
    dataset.insert(:name => 'BuildEmpire', :location => 'London')
  end
end

# 2-nd way:

# [
#     ['MoGo', 'New York'],
#     ['Wirkkle', 'London'],
#     ['Artesis', 'Saint-Petersburg'],
#     ['BuildEmpire', 'London']
#   ].each do |name, location|
#     Company.create name: name, location: location
#   end

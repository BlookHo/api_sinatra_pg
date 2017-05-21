namespace '/api/v1' do

  # TODO раскоммитить - тогда этот маршрут будет срабатывать, а не в routes
  #      по алфавиту папок

  # All geeks, filtered
  # get 'http://localhost:4567/geeks?stack=ruby
  # get '/companies' do
  #   companies = Company.all
  #   puts 'companies controller'
  #   [:co_name, :location].each do |filter|
  #     companies = companies.send(filter, params[filter]) if params[filter]
  #   end
  #   collection_to_api(companies)
  #
  #   # companies.to_json
  # end

  # All jobs of the company
  # get http://localhost:4567/api/v1/company_jobs?name=Mo
  get '/company_jobs' do
    call_method(Company, 'company_jobs', params[:co_name])
  end

end


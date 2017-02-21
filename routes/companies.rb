namespace '/api/v1' do

  # All companies, filtered
  # get 'http://localhost:4567/companies?name=Mo
  get '/companies' do
    companies = Company.all
    return collection_to_api(companies) if params.empty?
    if params['name']
      puts 'name'
      companies_all = Company.by_name(params['name'])
      if params['location']
        puts 'name + location'
        companies = companies_all.by_location(params['location'])
      else
        puts 'name NO location'
        companies = companies_all
      end
    else
      if params['location']
        puts 'location'
        companies = Company.by_location(params['location'])
      end
    end
    collection_to_api(companies)
  end

  # def collection_to_api(collection)
  #   MultiJson.dump(collection.map { |s| s.to_api })
  # end

  def self.geeks_applied_unread(name)
    geeks_applied = Apply.unread
    return geeks_applications(geeks_applied) if name.blank?
    name_filtering(geeks_applied, name)
  end


  # All jobs of the company
  # get http://localhost:4567/api/v1/company_jobs?name=Mo
  get '/company_jobs' do
    Company.company_jobs(params[:name])
    # call_one_method(Company, 'company_jobs', params[:name])
  end

end


namespace '/api/v1' do

  # http://localhost:4567/jobs?place=Remo
  # http://localhost:4567/jobs?name=j
  get '/jobs' do
    logger.info "Logger In get /gobs"
    jobs = Job.all
    [:place, :name].each do |filter|
      jobs = jobs.send(filter, params[filter]) if params[filter]
    end
    jobs.to_json
  end

  get '/jobs/delete' do
    Job.where(place: 'Remote').destroy
  end

  get '/jobs/delete_all' do
    Job.all.destroy
  end

  # Create new job by one company
  # http://localhost:4567/api/v1/job?company_id=58a0226677af2390cbccd265;name=Jira;place=Remote
  post '/job' do
    # puts "request.params = #{request.params.inspect} "
    # company = Company.find(params[:id])
    # halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) if company.blank?
    # puts "company id = #{company.id.inspect} "
    job = Job.new(request.params)
    halt(422, { message:'Unprocessible Entity', status: 422, params: request.params}.to_json) if job.blank?
    puts "json_params = ", request.params.to_json
    if job.save
      status 200
      job.to_json
    else
      raise StandardError.new("In POST '/geeks' - Unprocessible Entity 422")
    end
  end

  # job found by id:, to be deleted
  # http://localhost:4567/api/v1/job/58a566d6e61837294749441a
  delete '/job/:id' do
    job = Job.id(params[:id])
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) if job.blank?
    puts "job id = #{job.first.id.inspect} "
    if job.delete
      status 204
      puts "Status = #{status}"
    else
      raise StandardError.new("In DELETE '/job/:id' - Unprocessible Entity 422")
    end
  end

end


